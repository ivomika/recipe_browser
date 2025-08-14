import 'package:flutter/services.dart';

class IngredientCountTextFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.isEmpty) return TextEditingValue(text: '0');
    final regex = RegExp(r'^0\d');
    if(regex.hasMatch(newValue.text)) {
      return TextEditingValue(
        text: newValue.text.substring(1)
      );
    }

    return newValue;
  }
}