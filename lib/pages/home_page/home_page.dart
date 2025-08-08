import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/features/recipe_list_view/bloc/recipe_list_bloc.dart';
import 'package:recipe_browser/features/recipe_list_view/ui/recipe_list_view.dart';
import 'package:recipe_browser/features/search_field/ui/search_field.dart';
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
