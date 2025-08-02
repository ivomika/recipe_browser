import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_browser/entities/entities.dart';

part 'ingredient_table.g.dart';

@JsonSerializable()
class IngredientTable extends Ingredient{
  const IngredientTable({
    required super.name,
    required super.count,
    required super.type
  });

  factory IngredientTable.fromJson(Map<String, dynamic> json)
      => _$IngredientTableFromJson(json);

  Map<String, dynamic> toJson()
      => _$IngredientTableToJson(this);
}