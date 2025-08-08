import 'dart:async';
import 'package:drift/drift.dart';
import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/app/storage/drift/tabels/collection/converter/collection_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/cooking_step/converter/cooking_step_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/count_type/converter/count_type_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/ingredient/converter/ingredient_converter.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/converter/recipe_converter.dart';
import 'package:recipe_browser/entities/entities.dart';

class DriftCollectionRepository implements ICollectionRepository{
  final DriftAppDatabase _database;

  const DriftCollectionRepository(this._database);

  @override
  FutureOr<List<Collection>> all() async {
    final collections = await (_database
        .select(_database.collectionTable)
        .join([
            leftOuterJoin(
              _database.recipeCollectionsTable,
              _database.recipeCollectionsTable.collectionId.equalsExp(_database.collectionTable.id)
            ),
            leftOuterJoin(
              _database.recipeTable,
              _database.recipeTable.id.equalsExp(_database.recipeCollectionsTable.recipeId)
            ),
        ]))
        .get();

    final Map<CollectionTableData, List<RecipeTableData>> result = {};

    for(final row in collections){
      if(result.containsKey(row.readTable(_database.collectionTable))) {
        result[row.readTable(_database.collectionTable)]!.add(row.readTable(_database.recipeTable));
      }else{
        result[row.readTable(_database.collectionTable)] = [row.readTable(_database.recipeTable)];
      }
    }

    final ingredients = await (_database.select(_database.ingredientTable))
        .join([
            leftOuterJoin(
                _database.countTypeTable,
                _database.countTypeTable.id.equalsExp(_database.ingredientTable.typeId)
            )
        ])
        .get();
    final cookingSteps = await _database.select(_database.cookingStepTable).get();

    return result.entries.map((row) => CollectionConverter.toLocalModel(
        row.key,
        row.value
            .map((recipe) => RecipeConverter.toLocalModel(
              recipe,
              ingredients
                  .where((e) => e.readTable(_database.ingredientTable).recipeId == recipe.id)
                  .map((e) => IngredientConverter.toLocalModel(
                  e.readTable(_database.ingredientTable),
                  CountTypeConverter.toLocalModel(e.readTable(_database.countTypeTable))
                  )).toList(growable: false),
              cookingSteps
                  .where((e) => e.recipeId == recipe.id)
                  .map((e) => CookingStepConverter.toLocalModel(
                    e
                  )).toList(growable: false)
            ))
            .toList(growable: false)
    )).toList(growable: false);
  }

  @override
  FutureOr<Collection> byId(String id) async {
    final collection = await (_database.select(
        _database.collectionTable
    )..where((e) => e.id.equals(id)))
    .getSingle();

    final recipes = await (_database.select(_database.recipeCollectionsTable)
      ..where((e) => e.collectionId.equals(collection.id)))
      .join([
        leftOuterJoin(
            _database.recipeTable,
            _database.recipeTable.id.equalsExp(_database.recipeCollectionsTable.recipeId)
        )
      ])
      .get();

    final ingredients = (await (_database.select(_database.ingredientTable)
        ..where((e) => e.recipeId.isIn(
            recipes.map((e) => e.readTable(_database.recipeTable).id))
        ))
        .join([
      leftOuterJoin(
          _database.countTypeTable,
          _database.ingredientTable.typeId.equalsExp(_database.countTypeTable.id)
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
      ..where((e) => e.recipeId.isIn(
          recipes.map((e) => e.readTable(_database.recipeTable).id))))
        .get())
        .map((e) => CookingStepConverter.toLocalModel(e))
        .toList(growable: false);
    return CollectionConverter.toLocalModel(
        collection,
        recipes.map(
                (rowData) => RecipeConverter.toLocalModel(
                    rowData.readTable(_database.recipeTable),
                    ingredients,
                    cookingSteps
                )
        ).toList(growable: false)
    );
  }

  @override
  FutureOr<List<Collection>> byIds(List<String> ids) async {
    final collections = await ((_database
        .select(_database.collectionTable)
        ..where((e) => e.id.isIn(ids)))
        .join([
      leftOuterJoin(
          _database.recipeCollectionsTable,
          _database.recipeCollectionsTable.collectionId.equalsExp(_database.collectionTable.id)
      ),
      leftOuterJoin(
          _database.recipeTable,
          _database.recipeTable.id.equalsExp(_database.recipeCollectionsTable.recipeId)
      ),
    ]))
        .get();

    final Map<CollectionTableData, List<RecipeTableData>> result = {};

    for(final row in collections){
      if(result.containsKey(row.readTable(_database.collectionTable))) {
        result[row.readTable(_database.collectionTable)]!.add(row.readTable(_database.recipeTable));
      }else{
        result[row.readTable(_database.collectionTable)] = [row.readTable(_database.recipeTable)];
      }
    }

    final ingredients = await (_database.select(_database.ingredientTable))
        .join([
      leftOuterJoin(
          _database.countTypeTable,
          _database.countTypeTable.id.equalsExp(_database.ingredientTable.typeId)
      )
    ])
        .get();
    final cookingSteps = await _database.select(_database.cookingStepTable).get();

    return result.entries.map((row) => CollectionConverter.toLocalModel(
        row.key,
        row.value
            .map((recipe) => RecipeConverter.toLocalModel(
            recipe,
            ingredients
                .where((e) => e.readTable(_database.ingredientTable).recipeId == recipe.id)
                .map((e) => IngredientConverter.toLocalModel(
                e.readTable(_database.ingredientTable),
                CountTypeConverter.toLocalModel(e.readTable(_database.countTypeTable))
            )).toList(growable: false),
            cookingSteps
                .where((e) => e.recipeId == recipe.id)
                .map((e) => CookingStepConverter.toLocalModel(
                e
            )).toList(growable: false)
        ))
            .toList(growable: false)
    )).toList(growable: false);
  }

  @override
  FutureOr<Collection> create(Collection model) async {
    final collection =
        await _database.into(_database.collectionTable)
            .insertReturning(CollectionTableCompanion.insert(title: model.title));

    await _database.batch((batch) async {
        batch.insertAll(
            _database.recipeCollectionsTable,
            model.recipes.map((e) => RecipeCollectionsTableCompanion.insert(
                recipeId: e.id,
                collectionId: collection.id,
            )).toList(growable: false)
        );
    });

    return await byId(collection.id);
  }

  @override
  FutureOr<bool> delete(Collection model) async {
    await (_database.delete(_database.collectionTable)..where((e) => e.id.equals(model.id))).go();

    return true;
  }

  @override
  FutureOr<Collection> update(Collection model) async {
    await (_database.update(_database.collectionTable)
      ..where((e) => e.id.equals(model.id)))
      .write(CollectionTableCompanion.insert(title: model.title));

    await (_database.delete(_database.recipeCollectionsTable)
      ..where((e) => e.collectionId.equals(model.id)))
      .go();

    await _database.batch((batch) async {
      batch.insertAll(
          _database.recipeCollectionsTable,
          model.recipes.map((e) => RecipeCollectionsTableCompanion.insert(
            recipeId: e.id,
            collectionId: model.id,
          )).toList(growable: false)
      );
    });

    return await byId(model.id);
  }

  @override
  FutureOr<List<Collection>> byRecipeId(String id) async {
    final collections = (await (_database.select(_database.recipeCollectionsTable)
      ..where((e) => e.recipeId.equals(id)))
      .get())
      .map((e) => e.collectionId)
      .toList(growable: false);

    return await byIds(collections);
  }
}