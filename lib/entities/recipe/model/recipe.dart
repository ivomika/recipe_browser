import 'dart:math';

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

  /// Only for test
  factory Recipe.foo(){
    final random = Random();
    return Recipe.create(
        title: random.nextInt(200).toString(),
        description: random.nextInt(200).toString(),
        cookingTime: random.nextInt(200),
        kilocalories: random.nextInt(200),
        servings: random.nextInt(200),
        difficulty: random.nextInt(200).toString(),
        ingredients: [],
        cookingSteps: []
    );
  }
  
  @override
  List<Object?> get props => super.props..addAll([title, description, cookingTime, kilocalories, ingredients, cookingSteps]);

  @override
  String toString() {
    return 'Recipe{id: $id, createdAt: $createdAt, title: $title, description: $description, cookingTime: $cookingTime, kilocalories: $kilocalories, servings: $servings, difficulty: $difficulty, ingredients: $ingredients, cookingSteps: $cookingSteps}';
  }
}