import 'package:flutter/material.dart';
import 'package:recipe_browser/features/cooking_step_list_input/cooking_step_list_input.dart';
import 'package:recipe_browser/utils/utils.dart';

class CookingStepInputDismissible extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String? value) onSaved;
  final void Function() onDismissed;
  final int number;

  const CookingStepInputDismissible({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onDismissed,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(controller),
      onDismissed: (direction) => onDismissed(),
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
            bottom: context.offset.normal
        ),
        child: CookingStepInput(
            controller: controller,
            onSaved: onSaved,
            number: number,
        ),
      ),
    );
  }
}
