import 'package:recipe_browser/entities/base/base.dart';
import 'package:recipe_browser/entities/recipe/recipe.dart';

class Recipe extends BaseModel{
  /// title of recipe
  final String title;
  /// description of recipe
  final String description;
  /// cooking time in minutes
  final int cookingTime;
  /// kilocalories of recipe
  final int kilocalories;
  /// count of serving
  final int servings;
  /// Easy, Medium, Hard
  final String difficulty;
  /// list of ingredients
  final List<Ingredient> ingredients;
  /// list of steps
  final List<CookingStep> cookingSteps;

  const Recipe({
    required super.id,
    required super.createdAt,
    required this.title,
    required this.description,
    required this.cookingTime,
    required this.kilocalories,
    required this.servings,
    required this.difficulty,
    required this.ingredients,
    required this.cookingSteps,
  });


  Recipe.create({
    required this.title,
    required this.description,
    required this.cookingTime,
    required this.kilocalories,
    required this.servings,
    required this.difficulty,
    required this.ingredients,
    required this.cookingSteps,
  }) : super.create();
  
  @override
  List<Object?> get props => super.props..addAll([title, description, cookingTime, kilocalories, ingredients, cookingSteps]);

  @override
  String toString() {
    return 'Recipe{title: $title, description: $description, cookingTime: $cookingTime, kilocalories: $kilocalories, ingredients: $ingredients, cookingSteps: $cookingSteps}';
  }
}