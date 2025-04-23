import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:recipe_browser/features/drift/converter/ingredient_converter.dart';
import 'package:recipe_browser/features/drift/models/ingredient_model.dart';
import 'package:recipe_browser/features/drift/models/recipe_model.dart';

part 'drift_app_database.g.dart';

@DriftDatabase(tables: [RecipeModel])
class DriftAppDatabase extends _$DriftAppDatabase {
  DriftAppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.memory();
  }
}
