import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/pages/pages.dart';

class RecipeCookingPage extends StatelessWidget {
  final String? id;

  const RecipeCookingPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Готовим!'),
        ),
        BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
          builder: (context, state) {
            if(state is RecipeDetailLoaded) {
              return SliverToBoxAdapter(
                  child:
                  Text(state.stepIndex.toString()));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        SliverToBoxAdapter(
          child: IconButton(
              onPressed: () => context
                  .read<RecipeDetailBloc>()
                  .add(ConfirmRecipeDetailStep(id!, DateTime.now().second)),
              icon: Icon(Icons.add)),
        )
      ],
    );
  }
}
