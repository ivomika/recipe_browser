import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/features/recipe/models/recipe.dart';
import 'package:recipe_browser/features/recipe/repository/i_recipe_repository.dart';

class RecipeRepository implements IRecipeRepository{
  final DriftAppDatabase _database;

  const RecipeRepository(DriftAppDatabase database)
      : _database = database ;

  @override
  Future<List<Recipe>> all() async {
    final query = _database.select(_database.recipeModel);
    final results = await query.get();

    return results.map(
        (e) => e.toLocalModel()
    ).toList();
  }

  @override
  Future<Recipe> byId(String id) async {
    final model = await (_database
        .select(_database.recipeModel)
        ..where((recipe) => recipe.uuid.equals(id)))
        .getSingle();

    return model.toLocalModel();
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
    await (_database
        .delete(_database.recipeModel)
        ..where((recipe) => recipe.uuid.equals(model.id)))
        .go();

    return true;
  }

  @override
  Future<Recipe> update(Recipe model) async {
    await (_database
        .update(_database.recipeModel)
        ..where((recipe) => recipe.uuid.equals(model.id)))
        .replace(model.toDataModel());

    return await byId(model.id);
  }

  Future<RecipeModelData> _byId(int id) async {
    return await (_database
        .select(_database.recipeModel)
        ..where((recipe) => recipe.id.equals(id)))
        .getSingle();
  }

}