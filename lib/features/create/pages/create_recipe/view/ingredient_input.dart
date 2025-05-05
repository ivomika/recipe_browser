import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class IngredientInput extends StatelessWidget {
  final String index;
  const IngredientInput({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Название',
              hintText: 'Курица'
          ),
          validator: _ingredientNameValidator,
          onSaved: (value) => _ingredientNameSaved(value, context),
        ),
        SizedBox(
          height: context.offset.small,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Количество',
                    hintText: '100'
                ),
                validator: _ingredientCountValidator,
                onSaved: (value) => _ingredientCountSaved(value, context),
              ),
            ),
            SizedBox(
              width: context.offset.small,
            ),
            Flexible(
              flex: 1,
              child: DropdownButtonFormField(
                  items: CountType.values.map(
                          (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name)
                      )
                  ).toList(growable: false),
                  value: CountType.gram,
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

  void _countTypeChanged(CountType? value) {}

  String? _ingredientNameValidator(String? value) {
    if(value == null || value.isEmpty) return 'Название ингредиента должно быть заполнено';

    return null;
  }

  String? _ingredientCountValidator(String? value) {
    if(value == null || value.isEmpty) return 'Количество должно быть заполнено';

    return null;
  }

  void _ingredientNameSaved(String? newValue, BuildContext context) {
  }

  void _ingredientCountSaved(String? newValue, BuildContext context) {
  }

  void _countTypeSaved(CountType? newValue, BuildContext context) {
  }
}
