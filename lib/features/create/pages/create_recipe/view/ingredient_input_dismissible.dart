import 'package:flutter/material.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class IngredientInputDismissible extends StatelessWidget {
  final String index;

  const IngredientInputDismissible({
    super.key,
    required this.index
   });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(index),
        direction: DismissDirection.endToStart,
        onDismissed: _onDismissed,
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
        child: IngredientInput(
          index: index,
        )
    );
  }

  void _onDismissed(DismissDirection direction) {
  }
}
