import 'package:flutter/material.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/theme/extension/theme_context_extension.dart';
import 'package:uuid/uuid.dart';

class IngredientListInput extends StatefulWidget {
  const IngredientListInput({super.key});

  @override
  State<IngredientListInput> createState() => _IngredientListInputState();
}

class _IngredientListInputState extends State<IngredientListInput> {
  final List<IngredientInputDismissible> _inputs = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IngredientInput(),
        SizedBox(
          height: context.offset.normal,
        ),
        ..._inputs.map(
            (e) => Padding(
                padding: EdgeInsets.only(
                  bottom: context.offset.normal,
                ),
                child: e,
            )
        ),
        OutlinedButton.icon(
            onPressed: _addIngredient,
            icon: Icon(Icons.add), 
            label: Text('Новый ингредиент'),
        )
      ],
    );
  }

  void _addIngredient() {
    final index = Uuid().v1();
    _inputs.add(IngredientInputDismissible(
        index: index,
        onDismissed: (DismissDirection direction) => _removeIngredient(index),
    ));
    setState(() {});
  }

  void _removeIngredient(String index) {
    _inputs.removeWhere(
        (e) => e.index == index
    );
  }
}
