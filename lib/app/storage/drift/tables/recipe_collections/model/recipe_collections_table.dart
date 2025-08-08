import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/tables/collection/model/collection_table.dart';
import 'package:recipe_browser/app/storage/drift/tables/recipe/model/recipe_table.dart';

class RecipeCollectionsTable extends Table{
  TextColumn get recipeId => text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get collectionId => text().references(CollectionTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {recipeId, collectionId};
}