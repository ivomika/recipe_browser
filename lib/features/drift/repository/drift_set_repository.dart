import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';

class DriftSetRepository implements ISetRepository{
  final DriftAppDatabase _database;

  const DriftSetRepository(DriftAppDatabase database)
      : _database = database ;
  @override
  Future<List<Set>> all() async {
    final recipes = await _database.select(_database.setModel).get();

    return recipes.map((e) => e.toLocalModel()).toList(growable: false);
  }

  @override
  Future<Set> byId(String id) async {
    final set = await (_database
        .select(_database.setModel)
        ..where((set) => set.uuid.equals(id)))
        .getSingle();


    return set.toLocalModel();
  }

  @override
  Future<Set> create(Set model) async {
    final resultId = await _database
        .into(_database.setModel)
        .insert(model.toDataModel());

    return (await _byId(resultId)).toLocalModel();
  }

  @override
  Future<bool> delete(Set model) async {
    final deleteCount = await (_database
        .delete(_database.setModel)
      ..where((set) => set.uuid.equals(model.id)))
        .go();

    return deleteCount != 0;
  }

  @override
  Future<Set> update(Set model) async {
    await (_database
        .update(_database.setModel)
        ..where((set) => set.uuid.equals(model.id)))
        .write(model.toDataModel());

    return await byId(model.id);
  }

  Future<SetModelData> _byId(int id) async {
    return await (_database
        .select(_database.setModel)
        ..where((set) => set.id.equals(id)))
        .getSingle();
  }

  @override
  Future<List<Set>> byRecipeId(String id) async {
    final set = await (_database
        .select(_database.setModel)
        ..where((set) => set.recipeIds.contains(id)))
        .get();


    return set.map((e) => e.toLocalModel()).toList(growable: false);
  }
}