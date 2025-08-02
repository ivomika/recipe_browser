import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_browser/entities/entities.dart';

part 'cooking_step_table.g.dart';

@JsonSerializable()
class CookingStepTable extends CookingStep {
  const CookingStepTable({
    required super.description
  });

  factory CookingStepTable.fromJson(Map<String, dynamic> json)
      => _$CookingStepTableFromJson(json);

  Map<String, dynamic> toJson()
      => _$CookingStepTableToJson(this);
}