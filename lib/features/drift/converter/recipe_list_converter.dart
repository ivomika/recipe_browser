import 'dart:convert';
import 'package:drift/drift.dart';

class RecipeListConverter extends TypeConverter<List<String>, String> {
  const RecipeListConverter();

  @override
  List<String> fromSql(String fromDb) {
    final List<dynamic> jsonList = jsonDecode(fromDb);
    return jsonList
        .map((json) => json.toString())
        .toList();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }

}