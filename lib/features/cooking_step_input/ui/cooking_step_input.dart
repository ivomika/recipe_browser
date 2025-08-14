import 'package:flutter/material.dart';

class CookingStepInput extends StatelessWidget {
  final int index;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;

  const CookingStepInput({
    super.key,
    required this.index,
    this.validator,
    this.onSaved,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Шаг #$index'
      ),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
