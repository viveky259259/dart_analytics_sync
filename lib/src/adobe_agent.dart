import 'package:analytics_queue/src/analytics_storage.dart';
import 'package:analytics_queue/src/analytics_sync_manager.dart';
import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/event_type.dart';

class AdobeAgent implements Agent {
  AdobeAgent({required this.storage, required this.analyticsSyncManager});
  final AnalyticsSyncManager analyticsSyncManager;
  final AnalyticsStorage storage;
  @override
  void reportEvent(List<AnalyticsContext> contexts) {
    print('${contexts.length} event reported');
    storage.reportEvent(contexts);
    for (final each in contexts) {
      analyticsSyncManager.reportEvent(each, AdobeEventType.action);
    }
  }
}

abstract class Agent {
  void reportEvent(List<AnalyticsContext> context);
}
