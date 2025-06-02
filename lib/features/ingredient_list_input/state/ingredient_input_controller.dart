import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/models/models.dart';

class IngredientInputController extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController count = TextEditingController();
  CountType type = CountType.gram;

  IngredientInputController();

  @override
  void dispose() {
    name.dispose();
    count.dispose();
    super.dispose();
  }

  Ingredient save(){
    return Ingredient(
        name: name.text,
        count: double.tryParse(count.text) ?? 0,
        type: type
    );
  }
}
