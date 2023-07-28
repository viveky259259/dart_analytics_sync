import 'package:analytics_queue/src/_adobe_server.dart';
import 'package:analytics_queue/src/analytics_sync_manager.dart';
import 'package:analytics_queue/src/contexts/page_context.dart';
import 'package:analytics_queue/src/event_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('check conditions', () {
    test('event should fire in one second', () async {
      final analyticsSyncManager = AnalyticsSyncManager(
          adobeServer: AdobeServer(), timeDuration: Duration(seconds: 10),minEventToReport: 2);
      analyticsSyncManager.reportEvent(
          PageContext(
              pageContextName: 'neukit.analytics.context.widget',
              category: 'Home',
              pageContextData: {
                "pageIndex": 3,
                "groupIndex": 0,
                "itemCount": 5,
                "variant": null,
                "scrollPercentage": null,
                "eventType": "view",
                "name": null,
                "part": "self",
                'time': DateTime.now().millisecondsSinceEpoch
              }),
          AdobeEventType.action);

      expect(analyticsSyncManager.allContexts.length, 1);
      analyticsSyncManager.reportEvent(
          PageContext(
              pageContextName: 'neukit.analytics.context.widget',
              category: 'Home',
              pageContextData: {
                "pageIndex": 3,
                "groupIndex": 0,
                "itemCount": 5,
                "variant": null,
                "scrollPercentage": null,
                "eventType": "view",
                "name": null,
                "part": "self",
                'time': DateTime.now().millisecondsSinceEpoch
              }),
          AdobeEventType.action);
      expect(analyticsSyncManager.allContexts.length, 2);
      await Future.delayed(Duration(seconds: 1));
      expect(analyticsSyncManager.allContexts.length, 0);
    });
  });
}
