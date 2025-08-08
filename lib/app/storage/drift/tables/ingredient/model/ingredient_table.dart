import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/tables/count_type/model/count_type_table.dart';
import 'package:recipe_browser/app/storage/drift/tables/recipe/model/recipe_table.dart';
import 'package:uuid/uuid.dart';

class IngredientTable extends Table{
  TextColumn get id => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get name => text()();
  RealColumn get count => real()();
  TextColumn get typeId => text().references(CountTypeTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get recipeId => text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}