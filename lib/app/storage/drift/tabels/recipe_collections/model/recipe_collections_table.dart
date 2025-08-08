import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/tabels/collection/model/collection_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/model/recipe_table.dart';

class RecipeCollectionsTable extends Table{
  TextColumn get recipeUuid => text().references(RecipeTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get collectionUuid => text().references(CollectionTable, #uuid, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {recipeUuid, collectionUuid};
}