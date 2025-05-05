import 'package:flutter/material.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:uuid/uuid.dart';

class IngredientListInput extends StatefulWidget {
  const IngredientListInput({super.key});

  @override
  State<IngredientListInput> createState() => _IngredientListInputState();
}

class _IngredientListInputState extends State<IngredientListInput> {
  final List<Widget> _inputs = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IngredientInput(
          index: 'default',
        ),
        ..._inputs,
        OutlinedButton.icon(
            onPressed: _addIngredient,
            icon: Icon(Icons.add), 
            label: Text('Новый ингредиент'),
        )
      ],
    );
  }

  void _addIngredient() {
    _inputs.add(IngredientInputDismissible(index: Uuid().v1()));
    setState(() {});
  }
}
