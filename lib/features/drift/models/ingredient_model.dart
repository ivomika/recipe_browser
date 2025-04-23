import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';

class IngredientModel{
  final String name;
  final double count;
  final String type;

  IngredientModel({
    required this.name,
    required this.count,
    required this.type,
  });

  // Конвертация в JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'count': count,
    'type': type,
  };

  // Создание объекта из JSON
  factory IngredientModel.fromJson(Map<String, dynamic> json) => IngredientModel(
      name: json['name'],
      count: json['count'],
      type: json['type'],
  );
}

extension IngredientConverterToDataModel on Ingredient{
  IngredientModel toDataModel(){
    return IngredientModel(
        name: name,
        count: count,
        type: type.toString()
    );
  }
}

extension IngredientConverterToLocalModel on IngredientModel{
  Ingredient toLocalModel(){
    return Ingredient(
        name: name,
        count: count,
        type: CountType.values.firstWhere((e) => e.toString() == type)
    );
  }
}