import 'package:flutter/material.dart';
import 'package:recipe_browser/features/ingredient_list/ingredient_list.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class RecipeInfo extends StatelessWidget {
  final Recipe recipe;

  const RecipeInfo({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: context.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(
              context.offset.veryLarge + context.offset.normal
          )
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.offset.normal),
            sliver: SliverList.list(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                recipe.title,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  letterSpacing: 1
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: context.offset.normal,
                  ),
                  _Label(
                      icon: Icons.timer_outlined,
                      text: '${recipe.cookingTime} мин.'),
                  SizedBox(
                    width: context.offset.small,
                  ),
                  _Label(
                      icon: Icons.cookie_outlined,
                      text: '${recipe.kilocalories} ккал.'),
                  SizedBox(
                    width: context.offset.small,
                  ),
                  _Label(
                      icon: Icons.shopping_bag_outlined,
                      text: '${recipe.ingredients.length} шт.'),
                  SizedBox(
                    width: context.offset.small,
                  ),
                  _Label(
                      icon: Icons.checklist_outlined,
                      text: '${recipe.cookingSteps.length} шагов'),
                  SizedBox(
                    width: context.offset.normal,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(context.offset.normal),
            sliver: SliverToBoxAdapter(
              child: Text(
                  recipe.description,
                  style: TextStyle(
                    letterSpacing: 1
                  ),
              ),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.offset.normal
              ),
              sliver: SliverToBoxAdapter(
                child: IngredientList(
                    ingredients: recipe.ingredients
                ),
              ),
          )
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Label({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: context.theme.colorScheme.outline,
        ),
        SizedBox(width: context.offset.verySmall),
        Text(
          text,
          style: context.theme.textTheme.labelMedium
              ?.copyWith(color: context.theme.colorScheme.outline),
        )
      ],
    );
  }
}
