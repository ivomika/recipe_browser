import 'package:flutter/material.dart';
import 'package:recipe_browser/features/ingredient_list_input/state/ingredient_input_controller.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class IngredientInput extends StatelessWidget {
  final IngredientInputController controller;
  final void Function(Ingredient value) onSaved;

  const IngredientInput({
    super.key,
    required this.controller,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: controller.name,
          decoration: InputDecoration(
              labelText: 'Название',
              hintText: 'Курица'
          ),
          validator: _ingredientNameValidator,
        ),
        SizedBox(
          height: context.offset.small,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 3,
              child: TextFormField(
                controller: controller.count,
                decoration: InputDecoration(
                    labelText: 'Количество',
                    hintText: '100'
                ),
                keyboardType: TextInputType.number,
                validator: _ingredientCountValidator,
              ),
            ),
            SizedBox(
              width: context.offset.small,
            ),
            Flexible(
              flex: 2,
              child: DropdownButtonFormField(
                  items: CountType.values.map(
                          (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name)
                      )
                  ).toList(growable: false),
                  value: controller.type,
                  borderRadius: BorderRadius.circular(
                      context.offset.normal
                  ),
                  onChanged: _countTypeChanged,
                  onSaved: (value) => _countTypeSaved(value, context),
              ),
            ),
          ],
        ),

      ],
    );
  }

  String? _ingredientNameValidator(String? value) {
    if(value == null || value.isEmpty) return 'Название ингредиента должно быть заполнено';

    return null;
  }

  String? _ingredientCountValidator(String? value) {
    if(value == null || value.isEmpty) return 'Количество должно быть заполнено';

    return null;
  }

  void _countTypeChanged(CountType? value) {
    controller.type = value!;
  }

  void _countTypeSaved(CountType? newValue, BuildContext context) {
    onSaved.call(controller.save());
  }
}
