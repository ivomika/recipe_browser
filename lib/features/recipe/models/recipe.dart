import 'package:recipe_browser/base/model/base_model.dart';
import 'package:recipe_browser/features/recipe/models/ingredient.dart';

class Recipe extends BaseModel{
  /// title of recipe
  final String title;
  /// description of recipe
  final String description;
  /// cooking time in minutes
  final int cookingTime;
  /// kilocalories of recipe
  final int kilocalories;
  /// list of ingredients
  final List<Ingredient> ingredients;

  const Recipe({
    required super.id,
    required super.createdAt,
    required this.title,
    required this.description,
    required this.cookingTime,
    required this.kilocalories,
    required this.ingredients,
  });

  @override
  String toString() {
    return 'Recipe{title: $title, description: $description, cookingTime: $cookingTime, kilocalories: $kilocalories, ingredients: $ingredients}';
  }
}