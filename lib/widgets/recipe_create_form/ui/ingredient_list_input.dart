import 'package:flutter/material.dart';
import 'package:recipe_browser/features/ingridient_input/ui/ingredient_input.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';

class IngredientListInput extends StatefulWidget {
  const IngredientListInput({super.key});

  @override
  State<IngredientListInput> createState() => _IngredientListInputState();
}

class _IngredientListInputState extends State<IngredientListInput> {
  final List<int> _indexes = [];
  int _lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: context.offset.normal,
      children: [
        ...List.generate(
            _indexes.length,
            (index){
              return _IngredientTile(
                key: ValueKey(_indexes.elementAt(index)),
                onDelete: () => setState(() => _indexes.removeAt(index)),
              );
            }),
        FilledButton.tonal(
            onPressed: (){
              _indexes.add(_lastIndex);
              setState(() {
                _lastIndex++;
              });
            },
            child: Text('Добавить ингредиент')
        )
      ],
    );
  }
}

class _IngredientTile extends StatelessWidget {
  final Function() onDelete;

  const _IngredientTile({
    super.key,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.offset.verySmall,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: onDelete,
            child: Icon(Icons.delete)
        ),
        Expanded(
          child: IngredientInput(
              validator: (ingredient){
                if(ingredient.name.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (ingredient) {
                print(ingredient);
              }
          ),
        )
      ],
    );
  }
}

