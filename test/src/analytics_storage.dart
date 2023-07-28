import 'package:analytics_queue/src/analytics_storage.dart';
import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/contexts/page_context.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main(){

  group('db', () {
    test('get initial data from local on db creation', () async{

      final storage=AnalyticsStorage(isSimulated: true);
      expect((await storage.getContextsFromStorage()).length, 5);
    });

    test('remove data when reported', (){
      final storage=AnalyticsStorage(isSimulated: true);
      List<AnalyticsContext> contexts=[PageContext(
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
          }),PageContext(
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
          }),];
      storage.reportEvent(contexts);

      expect(storage.contexts.length, 2);


      storage.onEventReported([contexts.first]);
      expect(storage.contexts.length, 1);
      expect(storage.contexts[0].hashCode, contexts[1].hashCode);

    });
  });
}