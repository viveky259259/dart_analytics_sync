import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/contexts/page_context.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){
  test('get buffer string from contexts', () {
    //
    final time=DateTime.now().millisecondsSinceEpoch;
  final contexts= [PageContext(
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
          'time': time
        }),PageContext(
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
        'time': time
      }),];

      String expected='''"category":"Home"|"pageIndex":"3"|"groupIndex":"0"|"itemCount":"5"|"eventType":"view"|"part":"self"|"time":"$time"|"name":"neukit.analytics.context.widget";;;"category":"NeuPass"|"widgetTitle":"NeuPass"|"part":"self"|"eventType":"tap"|"time":"$time"|"name":"neukit.analytics.context.widget"''';
      String actual=AnalyticsContext.convertContextsToString(contexts.map((e) => e.data).toList());
      expect(actual, expected);
  });
}