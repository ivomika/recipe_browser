import 'package:flutter/material.dart';

class CookingStepInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String?) onSaved;
  final int number;

  const CookingStepInput({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _stepValidator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: 'Шаг #$number',
        hintText: 'Нарезать овощи'
      ),
    );
  }

  String? _stepValidator(String? value) {
    if(value == null || value.isEmpty) return 'Шаги готовки должны быть заполнены';

    return null;
  }
}
