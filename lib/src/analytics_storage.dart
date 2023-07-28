import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/contexts/db_impl.dart';

class AnalyticsStorage {
  late DbImpl dbImpl;
  final bool isSimulated;
  AnalyticsStorage({this.isSimulated=false}) {
    _init();
  }
  void _init() async {
    dbImpl=  DbImpl(simulated: isSimulated);
  }

  List<AnalyticsContext> contexts = [];

  Future<void> reportEvent(List<AnalyticsContext> contexts) async {
    this.contexts.addAll(contexts);
    return;
  }

  void onEventReported(List<AnalyticsContext> contexts) {
    // delete reported event
    for (final each in contexts) {
      this.contexts.remove(each);
    }
  }

  Future<bool> saveContextsToStorage() async {
    // TODO:: implement isar/hive to store data
    // Store contexts directly

    return true;
  }

  Future<List<AnalyticsContext>> getContextsFromStorage() async {
    contexts.addAll(await dbImpl.getData());
    return contexts;
  }

  void onAppClose() {
    dbImpl.store(contexts);
  }
}
