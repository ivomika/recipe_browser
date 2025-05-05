import 'package:recipe_browser/features/recipe/recipe.dart';

class CreateRecipeModel{
  String? title;
  String? description;
  int? cookingTime;
  int? kilocalories;
  List<Ingredient>? ingredients;

  CreateRecipeModel({
    this.title,
    this.description,
    this.cookingTime,
    this.kilocalories,
    this.ingredients,
  });
}