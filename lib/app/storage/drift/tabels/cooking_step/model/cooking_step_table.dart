import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/model/recipe_table.dart';
import 'package:uuid/uuid.dart';

class CookingStepTable extends Table{
  TextColumn get id => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get description => text()();
  TextColumn get recipeId => text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}