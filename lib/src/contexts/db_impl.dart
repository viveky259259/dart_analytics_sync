import 'dart:io';

import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:analytics_queue/src/contexts/db_context.dart';
import 'package:isar/isar.dart';

class DbImpl {
  late Isar isar;
  bool initiated = false;
  final bool simulated;

  DbImpl({this.simulated=false}){
    _init();
  }
  void _init() async {
    if (!simulated && !initiated) {
      final dir = Directory('db');
      if (!dir.existsSync()) {
        dir.createSync();
      }
      isar = await Isar.open(
        [DBContextSchema],
        directory: dir.path,
      );
    }
    initiated = true;
  }

  Future<List<DBContext>> getData() async {
    if (simulated) {
      return [
        DBContext.fromMap('hello', {
          "_type": "core.analytics.context.widget",
          "pageIndex": 3,
          "groupIndex": 0,
          "itemCount": 5,
          "variant": null,
          "scrollPercentage": null,
          "eventType": "view",
          "name": null,
          "part": "self"
        }),
        DBContext.fromMap('hello', {
          "_type": "core.analytics.context.widget",
          "pageIndex": 3,
          "groupIndex": 0,
          "itemCount": 5,
          "variant": null,
          "scrollPercentage": null,
          "eventType": "view",
          "name": null,
          "part": "self"
        }),
        DBContext.fromMap('hello', {
          "_type": "core.analytics.context.widget",
          "pageIndex": 3,
          "groupIndex": 0,
          "itemCount": 5,
          "variant": null,
          "scrollPercentage": null,
          "eventType": "view",
          "name": null,
          "part": "self"
        }),
        DBContext.fromMap('hello', {
          "_type": "core.analytics.context.widget",
          "pageIndex": 3,
          "groupIndex": 0,
          "itemCount": 5,
          "variant": null,
          "scrollPercentage": null,
          "eventType": "view",
          "name": null,
          "part": "self"
        }),
        DBContext.fromMap('hello', {
          "_type": "core.analytics.context.widget",
          "pageIndex": 3,
          "groupIndex": 0,
          "itemCount": 5,
          "variant": null,
          "scrollPercentage": null,
          "eventType": "view",
          "name": null,
          "part": "self"
        }),
      ];
    }
    return await isar.dBContexts.where().findAll();
  }

  void store(List<AnalyticsContext> contexts) {
    if (simulated) {
      return;
    }
    isar.writeTxn(() =>
        isar.dBContexts.putAll(contexts.map((e) => e.toDbContext()).toList()));

    isar.close();
  }
}
