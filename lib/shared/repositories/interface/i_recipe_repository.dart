import 'package:recipe_browser/shared/models/models.dart';

abstract interface class IRecipeRepository{
  Future<List<Recipe>> all();
  Future<Recipe> byId(String id);

  Future<List<Recipe>> byIds(List<String> ids);
  Future<Recipe> create(Recipe model);
  Future<Recipe> update(Recipe model);
  Future<bool> delete(Recipe model);
}