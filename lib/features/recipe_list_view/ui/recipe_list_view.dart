import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/features/recipe_list_view/bloc/recipe_list_bloc.dart';
import 'package:recipe_browser/shared/utils/utils.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeListBloc, RecipeListState>(
      listener: (context, state) {
        if(state is RecipeListError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.error)
            )
          );
        }
      },
      child: BlocSelector<RecipeListBloc, RecipeListState, List<Recipe>>(
            selector: (state) => state.recipes,
            builder: (context, recipes) {
              return SliverList.separated(
                itemCount: recipes.length,
                separatorBuilder: (context, index) => SizedBox(height: context.offset.normal),
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.zero,
                  child: ListTile(
                    title: Text(recipes.elementAt(index).title),
                  ),
                ),
              );
            }
        ),
    );
  }
}
