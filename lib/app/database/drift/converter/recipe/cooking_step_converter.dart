import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:recipe_browser/app/database/drift/model/recipe/cooking_step_table.dart';

class CookingStepConverter extends TypeConverter<List<CookingStepTable>, String>{
  const CookingStepConverter();

  @override
  List<CookingStepTable> fromSql(String fromDb) {
    final List<dynamic> jsonList = jsonDecode(fromDb);
    return jsonList
        .map((json) => CookingStepTable.fromJson(json as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  String toSql(List<CookingStepTable> value) {
    return jsonEncode(
        value.map(
                (e) => e.toJson()
        ).toList(growable: false)
    );
  }
}