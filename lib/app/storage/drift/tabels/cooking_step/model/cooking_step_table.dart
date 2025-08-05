import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/model/recipe_table.dart';

class CookingStepTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get description => text()();
  IntColumn get recipeId => integer().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
}