import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/app/storage/drift/tabels/collection/repository/drift_collection_repository.dart';
import 'package:recipe_browser/app/storage/drift/tabels/count_type/repository/drift_count_type_repository.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/repository/drift_recipe_repository.dart';
import 'package:recipe_browser/entities/entities.dart';

void main() {
  late DriftAppDatabase database = DriftAppDatabase(NativeDatabase.memory());
  late IRecipeRepository recipeRepository = DriftRecipeRepository(database);
  late ICountTypeRepository countTypeRepository = DriftCountTypeRepository(database);
  late ICollectionRepository collectionRepository = DriftCollectionRepository(database);

  tearDownAll(() async {
    await database.close();
  });

  group(
      'test count type CRUD',
      (){
        late CountType countType;

        test(
            'create',
            () async {
              final model = CountType.create(
                  name: 'Kg'
              );

              countType = await countTypeRepository.create(model);

              expect(
                  countType.name,
                  model.name,
              );
            }
        );

        test(
            'update',
                () async {
              final newModel = CountType(
                  id: countType.id,
                  createdAt: countType.createdAt,
                  name: 'Mlg'
              );

              countType = await countTypeRepository.update(
                  newModel
              );

              expect(
                  countType,
                  newModel,
              );
            }
        );

        test(
            'all',
                () async {
                await countTypeRepository.create(CountType.create(name: 'kg'));
                await countTypeRepository.create(CountType.create(name: 'lit'));
                await countTypeRepository.create(CountType.create(name: 'gram'));

                final result = await countTypeRepository.all();

                expect(
                    result.length,
                    (await database.countTypeTable.all().get()).length,
                );
            }
        );

        test(
            'by id',
            () async {
                final result = await countTypeRepository.byId(countType.id);

                expect(
                    result,
                    countType
                );
            }
        );

        test(
            'by ids',
            () async {
                final all = await countTypeRepository.all();

                final result = await countTypeRepository.byIds([countType.id, all.last.id]);

                expect(
                    result.length,
                    2
                );
                expect(
                    result.first.id,
                    countType.id
                );
                expect(
                    result.last.id,
                    all.last.id
                );
            }
        );

        test(
            'delete',
            () async {
                final oldCount = (await countTypeRepository.all()).length;
                final result = await countTypeRepository.delete(countType);
                final newCount = (await countTypeRepository.all()).length;

                expect(
                    result,
                    true
                );
                expect(
                    newCount,
                    oldCount - 1
                );

            }
        );
      }
  );

  group(
      'test recipe CRUD',
      (){
        late Recipe recipe;
        late CountType countType;

        test(
            'create',
                () async {
              countType = await countTypeRepository.create(
                  CountType.create(name: 'kg')
              );

              final model = Recipe.create(
                  title: 'recipe',
                  description: 'description',
                  cookingTime: 10,
                  kilocalories: 200,
                  servings: 2,
                  difficulty: 'hard',
                  ingredients: [
                    Ingredient(
                        name: 'ingredient 1',
                        count: 1,
                        type: countType
                    ),
                    Ingredient(
                        name: 'ingredient 2',
                        count: 2,
                        type: countType
                    ),
                  ],
                  cookingSteps: [
                    CookingStep(
                        description: 'step 1'
                    ),
                    CookingStep(
                        description: 'step 2'
                    ),
                    CookingStep(
                        description: 'step 3'
                    ),
                  ]
              );

              recipe = await recipeRepository.create(model);

              expect(
                recipe.title,
                model.title,
              );
              expect(
                recipe.ingredients.length,
                model.ingredients.length,
              );
              expect(
                recipe.cookingSteps.length,
                model.cookingSteps.length,
              );
            }
        );

        test(
            'update',
                () async {
              final newModel = Recipe(
                  id: recipe.id,
                  createdAt: recipe.createdAt,
                  title: 'recipe.title',
                  description: recipe.description,
                  cookingTime: recipe.cookingTime,
                  kilocalories: recipe.kilocalories,
                  servings: recipe.servings,
                  difficulty: recipe.difficulty,
                  ingredients: [
                    ...recipe.ingredients,
                    Ingredient(
                        name: 'ingredient 3',
                        count: 3,
                        type: countType
                    )
                  ],
                  cookingSteps: recipe.cookingSteps
              );

              recipe = await recipeRepository.update(
                  newModel
              );

              expect(
                recipe,
                newModel,
              );
              expect(
                recipe.ingredients.length,
                newModel.ingredients.length,
              );
              expect(
                recipe.title,
                newModel.title,
              );
            }
        );

        test(
            'all',
                () async {
              final result = await recipeRepository.all();

              expect(
                result.length,
                (await database.recipeTable.all().get()).length,
              );
            }
        );

        test(
            'by id',
                () async {
              final result = await recipeRepository.byId(recipe.id);

              expect(
                  result,
                  recipe
              );
            }
        );

        test(
            'by ids',
                () async {
              final result = await recipeRepository.byIds([recipe.id]);

              expect(
                  result.length,
                  1
              );
              expect(
                  result.first.id,
                  recipe.id
              );
            }
        );

        test(
            'delete',
                () async {
              final oldCount = (await recipeRepository.all()).length;
              final result = await recipeRepository.delete(recipe);
              final newCount = (await recipeRepository.all()).length;

              expect(
                  result,
                  true
              );
              expect(
                  newCount,
                  oldCount - 1
              );

            }
        );
      }
  );

  group(
      'test collection CRUD',
      () {
        final List<Recipe> recipes = [];
        late CountType countType;
        late Collection collection;

        setUpAll(
          () async {
              countType = await countTypeRepository.create(
                  CountType.create(name: 'kg')
              );

              final model = Recipe.create(
                  title: 'recipe',
                  description: 'description',
                  cookingTime: 10,
                  kilocalories: 200,
                  servings: 2,
                  difficulty: 'hard',
                  ingredients: [
                    Ingredient(
                        name: 'ingredient 1',
                        count: 1,
                        type: countType
                    ),
                    Ingredient(
                        name: 'ingredient 2',
                        count: 2,
                        type: countType
                    ),
                  ],
                  cookingSteps: [
                    CookingStep(
                        description: 'step 1'
                    ),
                    CookingStep(
                        description: 'step 2'
                    ),
                    CookingStep(
                        description: 'step 3'
                    ),
                  ]
              );

              recipes.addAll(
                  (await Future.wait<Recipe>([
                    Future(() => recipeRepository.create(model)),
                    Future(() => recipeRepository.create(model)),
                    Future(() => recipeRepository.create(model)),
                  ]))
              );
            }
        );


        test(
            'create',
            () async {
              final model = Collection.create(
                  title: 'collection 1',
                  recipes: recipes
              );

              collection = await collectionRepository.create(
                model
              );

              expect(
                  collection.title,
                  model.title
              );
            }
        );

        test(
            'update',
            () async {
              final model = Collection(
                  id: collection.id,
                  createdAt: collection.createdAt,
                  title: 'new collection 1',
                  recipes: recipes
              );

              collection =  await collectionRepository.update(model);

              expect(
                  collection,
                  model
              );
            }
        );

        test(
            'all',
            () async {

              await collectionRepository.create(collection);
              await collectionRepository.create(collection);
              await collectionRepository.create(collection);

              final result = await collectionRepository.all();

              expect(
                result.length,
                (await database.collectionTable.all().get()).length,
              );
            }
        );

        test(
            'byId',
            () async {
                final result = await collectionRepository.byId(collection.id);

                expect(
                    result.id,
                    collection.id
                );
            }
        );

        test(
            'byIds',
            () async {
                final all = await collectionRepository.all();
                final result = await collectionRepository.byIds([
                  all.first.id, all.last.id
                ]);

                expect(
                    result.length,
                    2
                );
                expect(
                    result.first.id,
                    all.first.id
                );
                expect(
                    result.last.id,
                    all.last.id
                );
            }
        );

        test(
            'delete',
            () async {
              final oldCount = (await collectionRepository.all()).length;
              final result = await collectionRepository.delete(collection);
              final newCount = (await collectionRepository.all()).length;

              expect(
                  result,
                  true
              );
              expect(
                  newCount,
                  oldCount - 1
              );

            }
        );
  });
}
