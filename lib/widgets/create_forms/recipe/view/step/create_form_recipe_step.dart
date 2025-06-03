import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/cooking_step_list_input/cooking_step_list_input.dart';
import 'package:recipe_browser/widgets/create_forms/create_forms.dart';

class CreateFormRecipeStep extends StatelessWidget {
  const CreateFormRecipeStep({super.key});

  @override
  Widget build(BuildContext context) {
    return CookingStepListInput(
        onSaved: (value) => _onSaved(value, context)
    );
  }

  void _onSaved(String? value, BuildContext context) {
    context
        .read<CreateRecipeCubit>()
        .state
        .data
        .cookingSteps
        ?.add(CreateCookingStepModel(
            description: value
        )
    );
  }
}
