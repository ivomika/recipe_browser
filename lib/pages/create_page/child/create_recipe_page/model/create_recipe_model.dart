import 'package:recipe_browser/pages/pages.dart';

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
    this.ingredients,
    this.cookingSteps
  });

  @override
  String toString() {
    return 'CreateRecipeModel{title: $title, description: $description, cookingTime: $cookingTime, kilocalories: $kilocalories, ingredients: $ingredients, cookingSteps: $cookingSteps}';
  }
}