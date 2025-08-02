import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:recipe_browser/app/database/drift/model/recipe/ingredient_table.dart';

class IngredientConverter extends TypeConverter<List<IngredientTable>, String> {
  const IngredientConverter();

  @override
  List<IngredientTable> fromSql(String fromDb) {
    final List<dynamic> jsonList = jsonDecode(fromDb);
    return jsonList
        .map((json) => IngredientTable.fromJson(json as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  String toSql(List<IngredientTable> value) {
    return jsonEncode(
        value.map(
                (e) => e.toJson()
        ).toList(growable: false)
    );
  }

}