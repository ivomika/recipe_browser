import 'package:flutter/material.dart';
import 'package:recipe_browser/features/ingredient_list_input/state/ingredient_input_controller.dart';
import 'package:recipe_browser/features/ingredient_list_input/view/ingredient_input.dart';
import 'package:recipe_browser/features/ingredient_list_input/view/ingredient_input_dismissible.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/extensions/theme_context_extension.dart';

class IngredientListInput extends StatefulWidget {
  final void Function(Ingredient value) onSaved;
  const IngredientListInput({
    super.key,
    required this.onSaved
  });

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
          onSaved: widget.onSaved,
        ),
        SizedBox(
          height: context.offset.normal,
        ),
        ..._inputs.map(
            (e) => IngredientInputDismissible(
                controller: e,
                onDismissed: (direction) => _removeIngredient(e),
                onSaved: widget.onSaved,
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
