import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/recipe/bloc/recipe_bloc.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          FilledButton(
              onPressed: (){
                context.read<RecipeBloc>().add(LoadingRecipes());
              },
              child: Text('Загрузить данные')
          ),
          FilledButton(
              onPressed: (){
                context.read<RecipeBloc>().add(CreateRecipe(
                  Recipe(
                            id: '',
                            createdAt: DateTime.now(),
                            title: 'Title ${DateTime.now()}',
                            description: 'Description ${DateTime.now()}',
                            cookingTime: 60,
                            kilocalories: 550,
                            ingredients: [
                              Ingredient(
                                  name: 'Курица',
                                  count: 1,
                                  type: CountType.piece
                              ),
                              Ingredient(
                                  name: 'Мясо',
                                  count: 1,
                                  type: CountType.piece
                              ),
                            ]
                  )
                ));
              },
              child: Text('Добавить')
          ),
          BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state){
                switch(state) {
                  case RecipeInitial():
                    return Center(
                      child: Text('Нет данных.')
                    );
                  case RecipeLoading():
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case RecipeLoaded():
                    return Expanded(
                        child: ListView.builder(
                            itemCount: state.recipes.length,
                            itemBuilder: (context, index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'id: ${state.recipes.elementAt(index).id}'
                                    ),
                                    Text(
                                      'Заголовок: ${state.recipes.elementAt(index).title}'
                                    ),
                                    Text(
                                      'Описание: ${state.recipes.elementAt(index).description}'
                                    ),
                                    Text(
                                      'Время готовки: ${state.recipes.elementAt(index).cookingTime.toString()}'
                                    ),
                                    Text(
                                      'Калории: ${state.recipes.elementAt(index).kilocalories.toString()}'
                                    ),
                                    Text(
                                      'Кол-во ингредиентов: ${state.recipes.elementAt(index).ingredients.length.toString()}'
                                    ),
                                  ],
                                ),
                              ),
                            )
                        )
                    );
                  case RecipeError():
                    return Center(
                        child: Text(state.error)
                    );
                }
              }
          ),
        ],
      );
  }
}
