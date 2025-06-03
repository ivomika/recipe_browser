import 'package:flutter/material.dart';
import 'package:recipe_browser/features/cooking_step_list_input/cooking_step_list_input.dart';
import 'package:recipe_browser/utils/utils.dart';

class CookingStepListInput extends StatefulWidget {
  final void Function(String? value) onSaved;

  const CookingStepListInput({
    super.key,
    required this.onSaved
  });

  @override
  State<CookingStepListInput> createState() => _CookingStepListInputState();
}

class _CookingStepListInputState extends State<CookingStepListInput> {
  final TextEditingController _mainStepController = TextEditingController();
  final List<TextEditingController> _controllers = [];

  @override
  void dispose() {
    _mainStepController.dispose();
    for(var controller in _controllers){
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CookingStepInput(
          controller: _mainStepController,
          onSaved: widget.onSaved,
          number: 1,
        ),
        SizedBox(height: context.offset.normal,),
        ...List.generate(
            _controllers.length,
            (index) => CookingStepInputDismissible(
                controller: _controllers.elementAt(index),
                onSaved: widget.onSaved,
                onDismissed: () => _removeInput(index),
                number: index + 2,
            ),
            growable: false
        ),
        OutlinedButton.icon(
            onPressed: _addInput,
            icon: Icon(Icons.add),
            label: Text('Добавить шаг'),
        )
      ],
    );
  }

  void _addInput(){
    setState(() => _controllers.add(TextEditingController()));
  }

  void _removeInput(int index){
    setState(() => _controllers.removeAt(index));
    _controllers.length;
  }
}
