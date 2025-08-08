import 'dart:async';
import 'package:recipe_browser/entities/recipe/recipe.dart';

abstract interface class IRecipeRepository {
  FutureOr<List<Recipe>> all();

  FutureOr<List<Recipe>> find(String query);

  FutureOr<Recipe> byId(String id);

  FutureOr<List<Recipe>> byIds(List<String> ids);

  FutureOr<Recipe> create(Recipe model);

  FutureOr<Recipe> update(Recipe model);

  FutureOr<bool> delete(Recipe model);
}
