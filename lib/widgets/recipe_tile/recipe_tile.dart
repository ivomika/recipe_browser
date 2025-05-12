import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/extensions/theme_context_extension.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  const RecipeTile({
    super.key,
    required this.recipe
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382,
      height: 286,
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: context.theme.colorScheme.surface,
        elevation: 8,
        borderRadius: BorderRadius.circular(
            context.offset.veryLarge
        ),
        child: InkWell(
          onTap: () => context.go('/recipe/${recipe.id}'),
          child: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 220,
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://placehold.co/500x500/png'
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 100,
                  padding: EdgeInsets.all(context.offset.normal),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(context.offset.veryLarge)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          recipe.title,
                          style: context.theme.textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          _Label(
                              icon: Icons.timer_outlined,
                              text: '${recipe.cookingTime} мин.'
                          ),
                          SizedBox(width: context.offset.small),
                          _Label(
                              icon: Icons.cookie_outlined,
                              text: '${recipe.kilocalories} ккал.'
                          ),
                          SizedBox(width: context.offset.small),
                          _Label(
                              icon: Icons.shopping_bag_outlined,
                              text: '${recipe.ingredients.length} шт.'
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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
          style: context.theme.textTheme.labelMedium?.copyWith(
              color: context.theme.colorScheme.outline
          ),
        )
      ],
    );
  }
}
