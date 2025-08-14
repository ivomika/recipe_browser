import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';
import 'package:recipe_browser/widgets/recipe_create_form/bloc/recipe_create_cubit.dart';
import 'package:recipe_browser/widgets/recipe_create_form/ui/recipe_create_form.dart';

class CreateRecipe extends StatelessWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecipeCreateCubit(
              context.read<IRecipeRepository>()
          ),
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<RecipeCreateCubit, RecipeCreateState>(
              listener: (context, state) {
                if (state is RecipeCreateError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(state.error)
                    )
                  );
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(context.offset.normal),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: RecipeCreateForm(
                          onSave: (data) => context.read<RecipeCreateCubit>().create(
                              Recipe.create(
                                  title: data['title'],
                                  description: data['description'],
                                  cookingTime: data['cookingTime'],
                                  kilocalories: data['kilocalories'],
                                  servings: data['servings'],
                                  difficulty: data['difficulty'],
                                  ingredients: data['ingredients'],
                                  cookingSteps: data['cookingSteps'],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
        ),
      ),
    );
  }
}
