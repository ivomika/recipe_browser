import 'package:flutter/material.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class IngredientInputDismissible extends StatelessWidget {
  final String index;
  final void Function(DismissDirection direction) onDismissed;

  const IngredientInputDismissible({
    super.key,
    required this.index,
    required this.onDismissed
   });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(index),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        background: Container(
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
        child: IngredientInput()
    );
  }
}
