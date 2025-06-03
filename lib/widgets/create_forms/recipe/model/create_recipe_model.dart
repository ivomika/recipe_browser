import 'package:recipe_browser/widgets/create_forms/recipe/model/create_cooking_step_model.dart';
import 'package:recipe_browser/widgets/create_forms/recipe/model/create_ingredient_model.dart';

class CreateRecipeModel{
  String? title;
  String? description;
  int? cookingTime;
  int? kilocalories;
  List<CreateIngredientModel>? ingredients;
  List<CreateCookingStepModel>? cookingSteps;

  CreateRecipeModel({
    this.title,
    this.description,
    this.cookingTime,
    this.kilocalories,
    required this.ingredients,
    required this.cookingSteps
  });

  @override
  String toString() {
    return 'CreateRecipeModel{title: $title, description: $description, cookingTime: $cookingTime, kilocalories: $kilocalories, ingredients: $ingredients, cookingSteps: $cookingSteps}';
  }
}