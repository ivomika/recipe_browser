import 'package:flutter/material.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';

class IngredientInputController extends ChangeNotifier{
    TextEditingController name = TextEditingController();
    TextEditingController count = TextEditingController();
    CountType type = CountType.gram;

    final CreateIngredientModel model = CreateIngredientModel();

    @override
  void dispose() {
    name.dispose();
    count.dispose();
    super.dispose();
  }
}