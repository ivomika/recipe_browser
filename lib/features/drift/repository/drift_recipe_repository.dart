import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';

class DriftRecipeRepository implements IRecipeRepository{
  final DriftAppDatabase _database;

  const DriftRecipeRepository(DriftAppDatabase database)
      : _database = database ;

  @override
  Future<List<Recipe>> all() async {
    final recipes = await _database.select(_database.recipeModel).get();

    return recipes.map((e) => e.toLocalModel()).toList(growable: false);
  }

  @override
  Future<Recipe> byId(String id) async {
    final recipe = await (_database
        .select(_database.recipeModel)
        ..where((recipe) => recipe.uuid.equals(id)))
        .getSingle();


    return recipe.toLocalModel();
  }

  @override
  Future<List<Recipe>> byIds(List<String> ids) async {
    final recipe = await (_database
        .select(_database.recipeModel)
        ..where((recipe) => recipe.uuid.isIn(ids)))
        .get();


    return recipe.map((e) => e.toLocalModel()).toList(growable: false);
  }

  @override
  Future<Recipe> create(Recipe model) async {
    final resultId = await _database
        .into(_database.recipeModel)
        .insert(model.toDataModel());

    return (await _byId(resultId)).toLocalModel();
  }

  @override
  Future<bool> delete(Recipe model) async {
    final deleteCount = await (_database
        .delete(_database.recipeModel)
        ..where((recipe) => recipe.uuid.equals(model.id)))
        .go();

    return deleteCount != 0;
  }

  @override
  Future<Recipe> update(Recipe model) async {
    await (_database
        .update(_database.recipeModel)
        ..where((recipe) => recipe.uuid.equals(model.id)))
        .write(model.toDataModel());

    return await byId(model.id);
  }

  Future<RecipeModelData> _byId(int id) async {
    return await (_database
        .select(_database.recipeModel)
        ..where((recipe) => recipe.id.equals(id)))
        .getSingle();
  }
}