import 'dart:async';
import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/app/storage/drift/tabels/cooking_step/converter/cooking_step_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/count_type/converter/count_type_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/ingredient/converter/ingredient_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/converter/recipe_converter.dart';
import 'package:recipe_browser/entities/entities.dart';

class DriftRecipeRepository implements IRecipeRepository{
  final DriftAppDatabase _database;

  const DriftRecipeRepository(this._database);

  @override
  FutureOr<List<Recipe>> all() async {
    final recipes = await _database
        .select(_database.recipeTable)
        .get();

    final ingredients = (await (_database.select(_database.ingredientTable))
        .join([
          leftOuterJoin(
              _database.countTypeTable,
              _database.ingredientTable.typeUuid.equalsExp(_database.countTypeTable.uuid)
          )
        ])
        .get());

    final cookingSteps = (await (_database.select(_database.cookingStepTable))
        .get());

    return recipes.map(
            (recipe) => RecipeConverter.toLocalModel(
              recipe,
              ingredients
                  .where((row) => row.readTable(_database.ingredientTable).recipeId == recipe.id)
                  .map((data) => IngredientConverter.toLocalModel(
                      data.readTable(_database.ingredientTable),
                      CountTypeConverter.toLocalModel(data.readTable(_database.countTypeTable))
                  ))
                  .toList(growable: false),
              cookingSteps
                  .where((e) => e.recipeId == recipe.id)
                  .map((e) => CookingStepConverter.toLocalModel(e))
                  .toList(growable: false)
            )
    ).toList(growable: false);
  }

  @override
  FutureOr<Recipe> byId(String id) async {
    final recipe = await (_database.select(
      _database.recipeTable
    )..where((e) => e.uuid.equals(id)))
    .getSingle();

    final ingredients = (await (_database.select(_database.ingredientTable)
      ..where((e) => e.recipeId.equals(recipe.id)))
      .join([
        leftOuterJoin(
            _database.countTypeTable,
            _database.ingredientTable.typeUuid.equalsExp(_database.countTypeTable.uuid)
        )
      ])
      .get())
      .map((e) => IngredientConverter.toLocalModel(
          e.readTable(_database.ingredientTable),
          CountTypeConverter.toLocalModel(
              e.readTable(_database.countTypeTable)
          )
      ))
      .toList(growable: false);

    final cookingSteps = (await (_database.select(_database.cookingStepTable)
      ..where((e) => e.recipeId.equals(recipe.id)))
      .get())
      .map((e) => CookingStepConverter.toLocalModel(e))
      .toList(growable: false);

    return RecipeConverter.toLocalModel(
      recipe,
      ingredients,
      cookingSteps
    );
  }

  @override
  FutureOr<List<Recipe>> byIds(List<String> ids) async {
    final recipe = await (_database
        .select(_database.recipeTable)
        ..where((recipe) => recipe.uuid.isIn(ids)))
        .get();

    return recipe.map((e) => RecipeConverter.toLocalModel(e)).toList(growable: false);
  }

  @override
  FutureOr<Recipe> create(Recipe model) async {
    final result = await _database.into(_database.recipeTable).insertReturning(
      RecipeTableCompanion.insert(
          title: model.title,
          description: model.description,
          cookingTime: model.cookingTime,
          kilocalories: model.kilocalories,
          servings: model.servings,
          difficulty: model.difficulty
      )
    );

    await _database.batch((batch) async{
      batch.insertAll(
          _database.ingredientTable,
          model.ingredients.map((e) => IngredientTableCompanion.insert(
              name: e.name,
              count: e.count,
              typeUuid: e.type.id,
              recipeId: result.id
          )
        ).toList(growable: false)
      );

      batch.insertAll(
          _database.cookingStepTable,
          model.cookingSteps.map((e) => CookingStepTableCompanion.insert(
              description: e.description,
              recipeId: result.id
          )
        ).toList(growable: false)
      );
    });

    return await byId(result.uuid);
  }

  @override
  FutureOr<bool> delete(Recipe model) async {
    await (_database.delete(_database.recipeTable)..where((e) => e.uuid.equals(model.id))).go();

    return true;
  }

  @override
  FutureOr<Recipe> update(Recipe model) async {
    final recipeId = await (_database.update(_database.recipeTable)
      ..where((e) => e.uuid.equals(model.id)))
      .write(RecipeTableCompanion.insert(
        title: model.title,
        description: model.description,
        cookingTime: model.cookingTime,
        kilocalories: model.kilocalories,
        servings: model.servings,
        difficulty: model.difficulty
    ));

    await (_database.delete(_database.ingredientTable)..where((e) => e.recipeId.equals(recipeId))).go();
    await (_database.delete(_database.cookingStepTable)..where((e) => e.recipeId.equals(recipeId))).go();

    await _database.batch((batch) async{
      batch.insertAll(
          _database.ingredientTable,
          model.ingredients.map((e) => IngredientTableCompanion.insert(
              name: e.name,
              count: e.count,
              typeUuid: e.type.id,
              recipeId: recipeId
          )
          ).toList(growable: false)
      );

      batch.insertAll(
          _database.cookingStepTable,
          model.cookingSteps.map((e) => CookingStepTableCompanion.insert(
              description: e.description,
              recipeId: recipeId
          )
          ).toList(growable: false)
      );
    });

    return await byId(model.id);
  }
}