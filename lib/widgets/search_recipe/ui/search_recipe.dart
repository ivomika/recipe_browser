import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/features/recipe_list_view/bloc/recipe_list_bloc.dart';
import 'package:recipe_browser/features/recipe_list_view/ui/recipe_list_view.dart';
import 'package:recipe_browser/features/search_field/ui/search_field.dart';

class SearchRecipe extends StatelessWidget {
  const SearchRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeListBloc>(
      create: (context) => RecipeListBloc(
        context.read<IRecipeRepository>()
      )..add(LoadingRecipeList()),
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SearchField(
                  onSubmitted: (text) => context.read<RecipeListBloc>()
                      ..add(LoadingRecipeList(query: text)),
                ),
              ),
              RecipeListView()
            ],
          );
        }
      ),
    );
  }
}
