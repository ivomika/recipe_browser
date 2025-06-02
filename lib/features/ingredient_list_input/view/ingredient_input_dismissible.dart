import 'package:flutter/material.dart';
import 'package:recipe_browser/features/ingredient_list_input/state/ingredient_input_controller.dart';
import 'package:recipe_browser/features/ingredient_list_input/view/ingredient_input.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class IngredientInputDismissible extends StatelessWidget {
  final IngredientInputController controller;
  final void Function(DismissDirection direction) onDismissed;
  final void Function(Ingredient value) onSaved;

  const IngredientInputDismissible({
    super.key,
    required this.controller,
    required this.onDismissed,
    required this.onSaved,
   });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(controller),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        background: Container(
          margin: EdgeInsets.only(
            bottom: context.offset.normal,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                context.offset.veryLarge
            ),
            color: context.theme.colorScheme.errorContainer,
          ),
          child: Center(
            child: Icon(
              Icons.delete,
              color: context.theme.colorScheme.onErrorContainer,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: context.offset.normal,
          ),
          child: IngredientInput(
            controller: controller,
            onSaved: onSaved,
          ),
        )
    );
  }
}
