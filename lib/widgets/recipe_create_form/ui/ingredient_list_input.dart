import 'package:flutter/material.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/features/ingridient_input/ui/ingredient_input.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';
import 'package:recipe_browser/widgets/recipe_create_form/model/list_model.dart';

class IngredientListInput extends StatefulWidget {
  final Function(List<Ingredient> value) onSaved;

  const IngredientListInput({
    super.key,
    required this.onSaved
  });

  @override
  State<IngredientListInput> createState() => _IngredientListInputState();
}

class _IngredientListInputState extends State<IngredientListInput> {
  final ListModel<Ingredient> _models = ListModel(
      initIndex: 0,
      initValue: []
  );

  @override
  Widget build(BuildContext context) {
    return FormField(
        onSaved: (_) => widget.onSaved(_models.values.toList(growable: false)),
        builder: (state){
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.offset.normal,
            children: [
              ...List.generate(
                  _models.length,
                      (index){
                    return _IngredientTile(
                        key: ValueKey(_models.indexes.elementAt(index)),
                        onDelete: () => setState(() => _models.removeAt(index)),
                        onChanged: (value) => _models.update(
                            _models.elementAt(index).key,
                            value!
                        )
                    );
                  }),
              FilledButton.tonal(
                  onPressed: () => setState(() => _models.insert(Ingredient(
                      name: '',
                      count: 0,
                      type: CountType.create(name: '')
                  ))),
                  child: Text('Добавить ингредиент')
              )
            ],
          );
        }
    );
  }
}

class _IngredientTile extends StatelessWidget {
  final void Function() onDelete;
  final void Function(Ingredient? value) onChanged;

  const _IngredientTile({
    super.key,
    required this.onDelete,
    required this.onChanged
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
                if(ingredient!.name.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onChanged: onChanged
          ),
        )
      ],
    );
  }
}

