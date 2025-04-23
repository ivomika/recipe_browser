import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                            title: 'Яичные конвертики с сыром и ветчиной в соусе из под',
                            description: 'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                            cookingTime: 35,
                            kilocalories: 550,
                            ingredients: [
                              Ingredient(
                                  name: 'Курица',
                                  count: 1,
                                  type: CountType.piece
                              ),
                              Ingredient(
                                  name: 'Мясо',
                                  count: 200,
                                  type: CountType.gram
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
                            itemBuilder: (context, index) => ListTile(
                              title: Text(state.recipes.elementAt(index).title),
                              subtitle: Text(state.recipes.elementAt(index).id),
                              onTap: () => context.push('/recipe/${state.recipes.elementAt(index).id}'),
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
