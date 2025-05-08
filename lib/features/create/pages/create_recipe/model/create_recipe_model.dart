import 'package:recipe_browser/features/create/create.dart';

class CreateRecipeModel{
  String? title;
  String? description;
  int? cookingTime;
  int? kilocalories;
  List<CreateIngredientModel>? ingredients;

  CreateRecipeModel({
    this.title,
    this.description,
    this.cookingTime,
    this.kilocalories,
    this.ingredients,
  });

  @override
  String toString() {
    return 'CreateRecipeModel{title: $title, description: $description, cookingTime: $cookingTime, kilocalories: $kilocalories, ingredients: $ingredients}';
  }
}