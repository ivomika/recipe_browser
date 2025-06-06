import 'package:recipe_browser/shared/models/models.dart';

abstract interface class ISetRepository{
  Future<List<Set>> all();
  Future<Set> byId(String id);
  Future<Set> create(Set model);
  Future<Set> update(Set model);
  Future<bool> delete(Set model);

  Future<List<Set>> byRecipeId(String id);
}