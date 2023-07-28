import 'package:analytics_queue/src/contexts/db_context.dart';
import 'package:isar/isar.dart';

const _eventSeparator = ';;;';

abstract class AnalyticsContext {
  abstract final String contextName;
  @ignore
  abstract final Map<String, dynamic> data;
  bool isImportant = false;

  String toBufferFromList(List<AnalyticsContext> contexts) {
    return convertContextsToString(contexts.map((e) => e.data).toList());
  }

  String addToBuffer(StringBuffer buffer) {
    if (buffer.isNotEmpty) {
      buffer.write(_eventSeparator);
    }
    buffer.write(_convertJsonToString(data));
    return buffer.toString();
  }

  static String convertContextsToString(List<Map<String, dynamic>> contexts) {
    StringBuffer buffer = StringBuffer();

    buffer.writeAll(
      contexts.map(
        (e) => _convertJsonToString(e),
      ),
      _eventSeparator,
    );

    return buffer.toString();
  }

  static String _convertJsonToString(Map<String, dynamic> json) {
    String prefix = '';
    StringBuffer buffer = StringBuffer();

    for (final MapEntry(key: key, value: value) in json.entries) {
      if (buffer.isNotEmpty) {
        prefix = '|';
      }
      if (value is Map) {
        buffer.write(prefix);
        buffer.write(_convertJsonToString(value as Map<String, dynamic>));
      } else {
        // do not add a value if it is null
        if (value != null) {
          // ignore: unnecessary_string_escapes
          buffer.write('$prefix\"$key\":\"$value\"');
        }
      }
    }
    return buffer.toString();
  }
}

extension AnalyticsContextConverter on AnalyticsContext {
  DBContext toDbContext() {
    return DBContext.fromMap(this.contextName, this.data);
  }
}