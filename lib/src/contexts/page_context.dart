import 'package:analytics_queue/src/contexts/analytics_context.dart';

class PageContext extends AnalyticsContext {
  PageContext({
    required this.pageContextName,
    required this.pageContextData,
    required this.category,
  });

  final String pageContextName;
  final Map<String, dynamic> pageContextData;
  final String category;
  @override
  String get contextName => pageContextName;

  @override
  Map<String, dynamic> get data =>
      {'category': category, 'data': pageContextData, 'name': pageContextName};

  @override
  String toBufferFromList(List<AnalyticsContext> contexts) {
    return AnalyticsContext.convertContextsToString(
        contexts.map((e) => e.data).toList());
  }
}
