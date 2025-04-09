import 'package:recipe_browser/features/recipe/models/recipe.dart';

abstract interface class IRecipeRepository{
  Future<List<Recipe>> all();
  Future<Recipe> byId(String id);
  Future<Recipe> create(Recipe model);
  Future<Recipe> update(Recipe model);
  Future<bool> delete(Recipe model);
}