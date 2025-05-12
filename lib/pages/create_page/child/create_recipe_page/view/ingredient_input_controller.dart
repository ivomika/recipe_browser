import 'package:flutter/material.dart';
import 'package:recipe_browser/pages/create_page/child/create_recipe_page/model/create_ingredient_model.dart';
import 'package:recipe_browser/shared/models/models.dart';

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