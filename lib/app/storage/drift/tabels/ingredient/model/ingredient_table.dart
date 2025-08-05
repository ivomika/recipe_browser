import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/tabels/count_type/model/count_type_table.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/model/recipe_table.dart';

class IngredientTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get name => text()();
  RealColumn get count => real()();
  TextColumn get typeUuid => text().references(CountTypeTable, #uuid, onDelete: KeyAction.cascade)();
  IntColumn get recipeId => integer().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
}