import 'dart:convert';

import 'package:analytics_queue/src/contexts/analytics_context.dart';
import 'package:isar/isar.dart';
part 'db_context.g.dart';

@collection
class DBContext extends AnalyticsContext {
  Id id = Isar.autoIncrement;
  String contextName;

  String get dataInString => jsonEncode(_map);
  DBContext(this.contextName);

  DBContext.fromMap(this.contextName, this._map);

  Map<String, dynamic> _map = {};

  @ignore
  @override
  Map<String, dynamic> get data => _map;
}


