import 'package:flutter/material.dart';

class CookingStepInput extends StatelessWidget {
  final int index;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  const CookingStepInput({
    super.key,
    required this.index,
    required this.validator,
    required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Шаг #$index'
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
