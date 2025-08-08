import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/entities/entities.dart';

class RecipeConverter{
  static Recipe toLocalModel(RecipeTableData data,[List<Ingredient> ingredients = const [], List<CookingStep> cookingSteps = const [],]){
    return Recipe(
        id: data.id,
        createdAt: data.createdAt,
        title: data.title,
        description: data.description,
        cookingTime: data.cookingTime,
        kilocalories: data.kilocalories,
        servings: data.servings,
        difficulty: data.difficulty,
        ingredients: ingredients,
        cookingSteps: cookingSteps
    );
  }
}