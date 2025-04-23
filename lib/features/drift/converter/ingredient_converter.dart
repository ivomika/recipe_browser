import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';

class IngredientConverter extends TypeConverter<List<IngredientModel>, String> {
  const IngredientConverter();

  @override
  List<IngredientModel> fromSql(String fromDb) {
    final List<dynamic> jsonList = jsonDecode(fromDb);
    return jsonList
        .map((json) => IngredientModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<IngredientModel> value) {
    return jsonEncode(
        value.map(
            (e) => e.toJson()
        ).toList(growable: false)
    );
  }

}