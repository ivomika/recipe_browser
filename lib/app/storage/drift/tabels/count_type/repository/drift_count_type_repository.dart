import 'dart:async';

import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/app/storage/drift/tabels/count_type/converter/count_type_converter.dart';
import 'package:recipe_browser/entities/count_type/count_type.dart';

class DriftCountTypeRepository implements ICountTypeRepository{
  final DriftAppDatabase _database;

  DriftCountTypeRepository(this._database);

  @override
  FutureOr<List<CountType>> all() async {
    final result = await _database
        .select(_database.countTypeTable)
        .get();

    return result.map((e) => CountTypeConverter.toLocalModel(e)).toList(growable: false);
  }

  @override
  FutureOr<CountType> byId(String id) async {
    final result = await (_database
        .select(_database.countTypeTable)
        ..where((e) => e.uuid.equals(id)))
        .getSingle();

    return CountTypeConverter.toLocalModel(result);
  }

  @override
  FutureOr<List<CountType>> byIds(List<String> ids) async {
    final result = await (_database
        .select(_database.countTypeTable)
        ..where((e) => e.uuid.isIn(ids)))
        .get();

    return result.map((e) => CountTypeConverter.toLocalModel(e)).toList(growable: false);
  }

  @override
  FutureOr<CountType> create(CountType model) async {
    final result = await _database.into(_database.countTypeTable).insertReturning(
        CountTypeTableCompanion.insert(
            name: model.name
        )
    );

    return CountTypeConverter.toLocalModel(result);
  }

  @override
  FutureOr<bool> delete(CountType model) async {
    await (_database.delete(_database.countTypeTable)..where((e) => e.uuid.equals(model.id))).go();

    return true;
  }

  @override
  FutureOr<CountType> update(CountType model) async {
    await (_database.update(_database.countTypeTable)..where((e) => e.uuid.equals(model.id)))
        .write(
      CountTypeTableCompanion.insert(
          name: model.name
      )
    );

    return await byId(model.id);
  }
}