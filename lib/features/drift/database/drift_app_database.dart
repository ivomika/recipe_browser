import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:uuid/uuid.dart';

part 'drift_app_database.g.dart';

@DriftDatabase(tables: [RecipeModel])
class DriftAppDatabase extends _$DriftAppDatabase {
  DriftAppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: _migration
    );
  }

  Future<void> _migration(Migrator m, int from, int to) async {
    if (from == 1) {
      await m.alterTable(TableMigration(
        recipeModel,
        newColumns: [recipeModel.cookingSteps],
        columnTransformer: {
          recipeModel.cookingSteps: const Constant<String>('[]')
        }
      ));
    }
  }
}
