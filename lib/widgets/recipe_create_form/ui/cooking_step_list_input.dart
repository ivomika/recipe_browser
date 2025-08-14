import 'package:flutter/material.dart';
import 'package:recipe_browser/features/cooking_step_input/ui/cooking_step_input.dart';
import 'package:recipe_browser/shared/utils/utils.dart';

class CookingStepListInput extends StatefulWidget {
  const CookingStepListInput({super.key});

  @override
  State<CookingStepListInput> createState() => _CookingStepListInputState();
}

class _CookingStepListInputState extends State<CookingStepListInput> {
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
              return _CookingStepTile(
                index: index,
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
            child: Text('Добавить шаг')
        )
      ],
    );
  }
}


class _CookingStepTile extends StatelessWidget {
  final int index;
  final Function() onDelete;

  const _CookingStepTile({
    super.key,
    required this.index,
    required this.onDelete,
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
              onSaved: (description) {
                print(description);
              }
          ),
        )
      ],
    );
  }
}


