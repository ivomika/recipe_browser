import 'package:flutter/material.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:recipe_browser/widgets/create_forms/create_forms.dart';

class CreateRecipeStepScreen extends StatelessWidget {
  const CreateRecipeStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
          context.offset.normal
      ).copyWith(
        bottom: 100
      ),
      child: CreateFormRecipeStep(),
    );
  }
}
