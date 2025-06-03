import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/ingredient_list_input/ingredient_list_input.dart';
import 'package:recipe_browser/shared/models/recipe/ingredient.dart';
import 'package:recipe_browser/widgets/create_forms/recipe/bloc/create_recipe_cubit.dart';
import 'package:recipe_browser/widgets/create_forms/recipe/model/create_ingredient_model.dart';

class CreateFormRecipeIngredient extends StatelessWidget {
  const CreateFormRecipeIngredient({super.key});

  @override
  Widget build(BuildContext context) {
    return IngredientListInput(onSaved: (value) => _onSaved(value, context));
  }

  void _onSaved(Ingredient value, BuildContext context) {
    context
        .read<CreateRecipeCubit>()
        .state
        .data
        .ingredients
        ?.add(CreateIngredientModel(
          name: value.name,
          count: value.count,
          type: value.type,
        ));
  }
}
