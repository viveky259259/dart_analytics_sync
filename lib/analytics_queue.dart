import 'package:analytics_queue/src/_adobe_server.dart';
import 'package:analytics_queue/src/adobe_agent.dart';
import 'package:analytics_queue/src/analytics_storage.dart';
import 'package:analytics_queue/src/analytics_sync_manager.dart';
import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/contexts/page_context.dart';
import 'package:analytics_queue/src/contexts/widget_context.dart';

List<AnalyticsContext> contexts = [
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
  PageContext(
      pageContextName: 'neukit.analytics.context.widget',
      category: 'NeuPass',
      pageContextData: {
        "widgetTitle": "NeuPass",
        "widgetType": null,
        "part": "self",
        "widgetIndex": null,
        "groupTitle": null,
        "groupIndex": null,
        "previousIndex": null,
        "itemCount": null,
        "variant": null,
        "businessCategory": null,
        "filter": null,
        "scrollPercentage": null,
        "itemNames": null,
        "eventType": "tap",
        "eventName": null,
        "referrerItemName": null,
        "referrerWidgetTitle": null,
        "referrerWidgetSlotNumber": null,
        "referrerWidgetItemRank": null,
        "referrerBannerSlideID": null,
        'time': DateTime.now().millisecondsSinceEpoch
      }),
  // WidgetContext(
  //     widgetContextName: 'creditCard',
  //     loadTime: Duration(milliseconds: 100),
  //     widgetContextData: {
  //       "contentType": null,
  //       "contentId": null,
  //       "contentName": null,
  //       "ctaUrl": "/neupass",
  //       "ctaLabel": "NeuPass",
  //       "ctaType": "internal",
  //       "choiceName": null,
  //       "choiceStatus": null,
  //       "productBrand": null,
  //       "productCategory": null,
  //       "productSubCategory": null,
  //       "rating": null,
  //       "originalPrice": null,
  //       "sellingPrice": null,
  //       "source": null,
  //       'time': DateTime.now().millisecondsSinceEpoch
  //     }),
  // WidgetContext(
  //     widgetContextName: 'offerCard',
  //     loadTime: Duration(milliseconds: 100),
  //     widgetContextData: {
  //       "contentType": null,
  //       "contentId": null,
  //       "contentName": null,
  //       "ctaUrl": "/neupass",
  //       "ctaLabel": "NeuPass",
  //       "ctaType": "internal",
  //       "choiceName": null,
  //       "choiceStatus": null,
  //       "productBrand": null,
  //       "productCategory": null,
  //       "productSubCategory": null,
  //       "rating": null,
  //       "originalPrice": null,
  //       "sellingPrice": null,
  //       "source": null,
  //       'time': DateTime.now().millisecondsSinceEpoch
  //     }),
];

void main() async {
  print('function start');
  final analyticsStorage = AnalyticsStorage()..getContextsFromStorage();
  final adobeServer = AdobeServer();

  final analyticsSyncManager = AnalyticsSyncManager(
      minEventToReport: 100,
      minBufferSizeToReport: 10000,
      adobeServer: adobeServer,
      timeDuration: Duration(seconds: 20));

  final adobeAgent = AdobeAgent(
      storage: analyticsStorage, analyticsSyncManager: analyticsSyncManager);

  adobeAgent.reportEvent(contexts);
  late Function startReportingSim;

  startReportingSim = () async {
    await Future.delayed(Duration(seconds: 1));
    adobeAgent.reportEvent(contexts);
  };
  await startReportingSim();
  await startReportingSim();
  await startReportingSim();
  await startReportingSim();
  await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();
  // await startReportingSim();

  analyticsSyncManager.stop();

  analyticsStorage.onAppClose();
  print('function end');
}
