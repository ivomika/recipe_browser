import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';
import 'package:recipe_browser/widgets/recipe_create_form/ui/recipe_create_form.dart';

class CreateRecipe extends StatelessWidget {
  const CreateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(context.offset.normal),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: RecipeCreateForm(
                    onSave: (data) => print(data),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
