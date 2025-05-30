import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/cooking_stepper/cooking_stepper.dart';
import 'package:recipe_browser/pages/pages.dart';
import 'package:recipe_browser/utils/utils.dart';

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
        SliverToBoxAdapter(
          child: SizedBox(height: context.offset.normal,),
        ),
        BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
          builder: (context, state) {
            if(state is RecipeDetailLoaded) {
              if(state.recipe.cookingSteps.isEmpty){
                return SliverToBoxAdapter(
                  child: Center(
                      child: Text('Тут пусто...')
                  ),
                );
              }
              
              return SliverToBoxAdapter(
                  child: CookingStepper(
                      steps: state.recipe.cookingSteps,
                      currentIndex: state.stepIndex,
                      onStepContinue: () => _onStepContinue(context, state),
                      onStepTapped: (index) => _onStepTapped(context, index)
                  )
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }

  void _onStepContinue(BuildContext context, RecipeDetailLoaded currentState) {
    if(currentState.stepIndex == currentState.recipe.cookingSteps.length -1){
      return;
    }

    context.read<RecipeDetailBloc>().add(ConfirmRecipeDetailStep(
        id!,
        currentState.stepIndex + 1
    ));
  }

  void _onStepTapped(BuildContext context, int index) {
    context.read<RecipeDetailBloc>().add(ConfirmRecipeDetailStep(
        id!,
        index
    ));
  }
}
