import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';

class CookingStepConverter extends TypeConverter<List<CookingStepModel>, String> {
  const CookingStepConverter();

  @override
  List<CookingStepModel> fromSql(String fromDb) {
    final List<dynamic> jsonList = jsonDecode(fromDb);
    return jsonList
        .map((json) => CookingStepModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<CookingStepModel> value) {
    return jsonEncode(
        value.map(
                (e) => e.toJson()
        ).toList(growable: false)
    );
  }

}