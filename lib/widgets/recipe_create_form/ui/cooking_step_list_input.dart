import 'package:flutter/material.dart';
import 'package:recipe_browser/features/cooking_step_input/ui/cooking_step_input.dart';
import 'package:recipe_browser/shared/utils/utils.dart';
import 'package:recipe_browser/widgets/recipe_create_form/model/list_model.dart';

class CookingStepListInput extends StatefulWidget {
  final Function(List<String> value) onSaved;

  const CookingStepListInput({
    super.key,
    required this.onSaved
  });

  @override
  State<CookingStepListInput> createState() => _CookingStepListInputState();
}

class _CookingStepListInputState extends State<CookingStepListInput> {
  final ListModel<String> _models = ListModel(
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
                    return _CookingStepTile(
                      index: index,
                      key: ValueKey(_models.indexes.elementAt(index)),
                      onDelete: () => setState(() => _models.removeAt(index)),
                      onChanged: (value) => _models.update(
                          _models.elementAt(index).key,
                          value!
                      ),
                    );
                  }),
              FilledButton.tonal(
                  onPressed: () => setState(() => _models.insert('')),
                  child: Text('Добавить шаг')
              )
            ],
          );
        }
    );
  }
}


class _CookingStepTile extends StatelessWidget {
  final int index;
  final Function() onDelete;
  final Function(String? value) onChanged;

  const _CookingStepTile({
    super.key,
    required this.index,
    required this.onDelete,
    required this.onChanged,
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
          child: CookingStepInput(
              index: index + 1,
              validator: (description){
                if(description == null || description.isEmpty){
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


