import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/shared/models/recipe/recipe.dart';
import 'package:uuid/uuid.dart';

class RecipeModel extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get cookingTime => integer()();
  IntColumn get kilocalories => integer()();
  TextColumn get ingredients => text().map(const IngredientConverter())();
}

extension RecipeConverterToDataModel on Recipe{
  RecipeModelCompanion toDataModel(){
    return RecipeModelCompanion(
        title: Value(title),
        description: Value(description),
        cookingTime: Value(cookingTime),
        kilocalories: Value(kilocalories),
        ingredients: Value(
            ingredients.map(
                (e) => e.toDataModel()
            ).toList(growable: false)
        )
    );
  }
}

extension RecipeConverterToLocalModel on RecipeModelData{
  Recipe toLocalModel(){
    return Recipe(
        id: uuid,
        createdAt: createdAt,
        title: title,
        description: description,
        cookingTime: cookingTime,
        kilocalories: kilocalories,
        ingredients: ingredients.map(
            (e) => e.toLocalModel()
        ).toList(growable: false)
    );
  }
}