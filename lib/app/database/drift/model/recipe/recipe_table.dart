import 'package:drift/drift.dart';
import 'package:recipe_browser/app/database/drift/converter/recipe/cooking_step_converter.dart';
import 'package:recipe_browser/app/database/drift/converter/recipe/ingredient_converter.dart';
import 'package:uuid/uuid.dart';

class RecipeTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get cookingTime => integer()();
  IntColumn get kilocalories => integer()();
  IntColumn get servings => integer()();
  IntColumn get difficulty => integer()();
  TextColumn get ingredients => text().map(const IngredientConverter())();
  TextColumn get cookingSteps => text().map(const CookingStepConverter())();
}