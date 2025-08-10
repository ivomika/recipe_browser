import 'package:flutter/material.dart';
import 'package:recipe_browser/widgets/search_recipe/ui/search_recipe.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SearchRecipe()
        ),
      ),
    );
  }
}
