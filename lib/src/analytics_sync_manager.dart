import 'dart:async';

import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/event_type.dart';

import '_adobe_server.dart';

class AnalyticsSyncManager {
  AnalyticsSyncManager(
      {required this.adobeServer,
      required this.timeDuration,
      this.minEventToReport = 30,
      this.minBufferSizeToReport = 1000,
      this.onEventReported}) {
    _startTimer();
  }

  final int minEventToReport;
  final int minBufferSizeToReport;
  final Duration timeDuration;
  final AdobeServer adobeServer;
  late Timer timer;
  final Function({required AdobeEventType type})? onEventReported;
  final _allActionContexts = List<AnalyticsContext>.empty(growable: true);
  final _allStateContexts = List<AnalyticsContext>.empty(growable: true);
  final _bufferActionContexts = List<AnalyticsContext>.empty(growable: true);
  final _bufferStateContexts = List<AnalyticsContext>.empty(growable: true);
  final _bufferActionString = StringBuffer();
  final _bufferStateString = StringBuffer();

  List<AnalyticsContext> get allContexts =>_allActionContexts;

  // to check if event reporting is on
  bool _hasActionEventReported = false;
  bool _hasStateEventReported = false;

  bool get hasEventReported =>
      _hasActionEventReported || _hasStateEventReported;

  void reportEvent(AnalyticsContext context, final AdobeEventType eventType) {
    if (eventType == AdobeEventType.action) {
      _allActionContexts.add(context);
      _onNewContext(context, eventType);
    } else if (eventType == AdobeEventType.state) {
      _allStateContexts.add(context);
      _onNewContext(context, eventType);
    }
  }

  // if condition is not met then add new context to buffer
  void _onNewContext(AnalyticsContext context, final AdobeEventType eventType) {
    _addContextToBuffer(context, eventType);
    print('newcontext: add context');
    if (!hasEventReported && _hasDataConditionMet(eventType)) {
      _initiateReport();
    }
  }

  void _addContextToBuffer(
      AnalyticsContext context, final AdobeEventType eventType) {
    if (eventType == AdobeEventType.action) {
      _bufferActionContexts.add(context);
      // _writeStringToBuffer(context.addToBuffer(), eventType);
      context.addToBuffer(_bufferActionString);
    } else if (eventType == AdobeEventType.state) {
      _bufferStateContexts.add(context);
      // _writeStringToBuffer(context.addToBuffer(), eventType);
      context.addToBuffer(_bufferStateString);
    }
  }

  void _writeStringToBuffer(String string, final AdobeEventType eventType) {
    if (eventType == AdobeEventType.action) {
      if (_bufferActionString.isNotEmpty) {
        _bufferActionString.write(';');
      }
      _bufferActionString.write(string);
    } else if (eventType == AdobeEventType.state) {
      if (_bufferStateString.isNotEmpty) {
        _bufferStateString.write(';');
      }
      _bufferStateString.write(string);
    }
  }

  void onTimerComplete() {
    // send data to server
    _initiateReport();
  }

  _fillInBufferToReport(AdobeEventType eventType) {
    if (eventType == AdobeEventType.action) {
      for (final each in _allActionContexts.getRange(
          _bufferActionContexts.length - 1, _allActionContexts.length - 1)) {
        _addContextToBuffer(each, eventType);
        if (_hasDataConditionMet(eventType)) {
          break;
        }
      }
    } else if (eventType == AdobeEventType.state) {
      for (final each in _allActionContexts.getRange(
          _bufferActionContexts.length - 1, _allActionContexts.length - 1)) {
        _addContextToBuffer(each, eventType);
        if (_hasDataConditionMet(eventType)) {
          break;
        }
      }
    }
  }

  void _initiateReport() {
    _hasActionEventReported = true;
    _hasStateEventReported = true;
    try {
      // if (_allActionContexts.length > _bufferActionContexts.length &&
      //     _bufferActionString.length < minBufferSizeToReport &&
      //     _bufferActionContexts.length < minEventToReport) {
      //   _fillInBufferToReport(AdobeEventType.action);
      // }

      // if (_allStateContexts.length > _bufferStateContexts.length &&
      //     _bufferStateString.length < minBufferSizeToReport &&
      //     _bufferStateContexts.length < minEventToReport) {
      //   _fillInBufferToReport(AdobeEventType.state);
      // }

      _sendActionToServer(_bufferActionString.toString()).then((_) {
        // TODO:: check for reporting completion status
        print('event sent');

        _hasActionEventReported = false;

        _resetBuffer(AdobeEventType.action);

        print(
            'buffer cleaned: ${_bufferActionContexts.length} | ${_bufferActionString.length}');

        _updateBuffer(_allActionContexts, AdobeEventType.action);

        print(
            'buffer updated: ${_bufferActionContexts.length} | ${_bufferActionString.length}');

        onEventReported?.call(type: AdobeEventType.action);
      });
    } catch (e) {
      // sending events failed
      // TODO:: handle failed event
    }
    try {
      _sendStateToServer(_bufferStateString.toString()).then((_) {
        // TODO:: check for reporting completion status
        _hasStateEventReported = false;
        _resetBuffer(AdobeEventType.state);
        _updateBuffer(_allActionContexts, AdobeEventType.action);

        onEventReported?.call(type: AdobeEventType.state);
      });
    } catch (e) {
      // sending events failed
      // TODO:: handle failed event
    }
  }

  void _resetBuffer(final AdobeEventType eventType) {
    if (eventType == AdobeEventType.action) {
      print(
          'current action: ${_allActionContexts.length} ${_bufferActionContexts.length}');
      _allActionContexts.removeAll(_bufferActionContexts);
      _bufferActionContexts.clear();
      print(
          'after clear action: ${_allActionContexts.length} ${_bufferActionContexts.length}');
      _bufferActionString.clear();
    } else if (eventType == AdobeEventType.state) {
      _allStateContexts.removeAll(_bufferStateContexts);
      _bufferStateContexts.clear();
      _bufferStateString.clear();
    }
  }

  void _updateBuffer(
    List<AnalyticsContext> allActionContexts,
    final AdobeEventType eventType,
  ) {
    final temp = allActionContexts.take(minEventToReport).toList();
    for (final each in temp) {
      _addContextToBuffer(each, eventType);
      allActionContexts.remove(each);
      // stop adding context to buffer as soon as condition to send event match
      if (_hasDataConditionMet(eventType)) {
        break;
      }
    }
  }

  bool _hasDataConditionMet(final AdobeEventType eventType) {
    // check for count == minEventToReport
    // check for buffer > <minBufferSizeToReport> 50KB

    if (eventType == AdobeEventType.action) {
      // TODO:: function to check size of buffer
      if (_bufferActionContexts.length >= minEventToReport ||
          _bufferActionString.length >= minBufferSizeToReport) {
        print('action condition met!');
        print(
            'Length: ${_bufferActionContexts.length}  size:${_bufferActionString.length}');
        return true;
      }
    } else if (eventType == AdobeEventType.state) {
      if (_bufferStateContexts.length > minEventToReport ||
          _bufferStateString.length > minBufferSizeToReport) {
        print('state condition met!');
        print(
            'Length: ${_bufferStateContexts.length}  size: ${_bufferStateString.length}');
        return true;
      }
    }

    return false;
  }

  Future<void> _sendActionToServer(String buffer) async {
    // get Map to report

    return adobeServer.reportAction(
        'action', getJson(buffer));
  }

  Future<void> _sendStateToServer(String buffer) async {
    // get Map to report
    return adobeServer.reportState(
        'state', getJson(buffer));
  }

  Map<String, dynamic> getJson(String buffer) {
    return {
      'eventName': 'buffer',
      'data': {
        'list1': buffer,
      }
    };
  }

  void _startTimer() {
    late Function function;
    function = () {
      _initiateReport();
      timer.cancel();
      timer = getTimer(((a) => function()));
    };
    timer = getTimer(((a) => function()));
  }

  Timer getTimer(Function(Timer) callback) {
    return Timer.periodic(timeDuration, (timer) {
      print('timer call:${timer.tick}');
      callback(timer);
    });
  }

  void stop() {
    timer.cancel();
  }

  void onAppClose() {
    
  }
}

extension RemoveAll on List<AnalyticsContext> {
  void removeAll(List<AnalyticsContext> list) {
    for (final each in list) {
      remove(each);
    }
  }
}
