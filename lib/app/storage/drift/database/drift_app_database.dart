import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_browser/app/storage/drift/tabels/collection/model/collection_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/cooking_step/model/cooking_step_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/count_type/model/count_type_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/ingredient/model/ingredient_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/model/recipe_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe_collections/model/recipe_collections_table.dart';
import 'package:uuid/uuid.dart';

part 'drift_app_database.g.dart';

@DriftDatabase(tables: [RecipeTable, CookingStepTable, IngredientTable, CountTypeTable, CollectionTable, RecipeCollectionsTable])
class DriftAppDatabase extends _$DriftAppDatabase {
  DriftAppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

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
}