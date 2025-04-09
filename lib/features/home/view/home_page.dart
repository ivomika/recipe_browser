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
                            title: 'Title ${DateTime.now()}'
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
