import 'package:flutter/material.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/theme/extension/theme_context_extension.dart';

class IngredientListInput extends StatefulWidget {
  const IngredientListInput({super.key});

  @override
  State<IngredientListInput> createState() => _IngredientListInputState();
}

class _IngredientListInputState extends State<IngredientListInput> {
  final IngredientInputController mainIngredientController = IngredientInputController();
  final List<IngredientInputController> _inputs = [];

  @override
  void dispose() {
    mainIngredientController.dispose();
    for(var input in _inputs){
      input.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IngredientInput(
          controller: mainIngredientController,
        ),
        SizedBox(
          height: context.offset.normal,
        ),
        ..._inputs.map(
            (e) => IngredientInputDismissible(
                controller: e,
                onDismissed: (direction) => _removeIngredient(e),
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
    _inputs.add(IngredientInputController());
    setState(() {});
  }

  void _removeIngredient(IngredientInputController controller) {
    _inputs.remove(controller);
    setState(() {});
  }
}
