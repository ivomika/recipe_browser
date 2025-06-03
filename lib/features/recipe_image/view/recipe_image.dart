import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/models/models.dart';

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  const RecipeImage({
    super.key,
    required this.recipe
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 260,

      child: Image.asset(
          fit: BoxFit.cover,
          'assets/placeholder/recipe_placeholder.jpg'
      ),
    );
  }
}
