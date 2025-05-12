import 'package:recipe_browser/pages/create_page/child/create_recipe_page/model/create_ingredient_model.dart';

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