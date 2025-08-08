import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/entities/entities.dart';

class IngredientConverter{
  static Ingredient toLocalModel(IngredientTableData data, CountType type){
    return Ingredient(
      name: data.name,
      count: data.count,
      type: type
    );
  }
}