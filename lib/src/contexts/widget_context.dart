import 'package:analytics_queue/src/contexts/analytics_context.dart';

class WidgetContext extends AnalyticsContext {
  WidgetContext({
    required this.widgetContextName,
    required this.widgetContextData,
    required this.loadTime,
  });

  final String widgetContextName;
  final Map<String, dynamic> widgetContextData;
  final Duration loadTime;
  @override
  String get contextName => widgetContextName;

  @override
  Map<String, dynamic> get data => widgetContextData;
}
