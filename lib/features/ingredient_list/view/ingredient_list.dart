import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;
  const IngredientList({
    super.key,
    required this.ingredients
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          ingredients.length,
          (index) => _Tile(
              title: _buildTileText(ingredients.elementAt(index))
          )
      ),
    );
  }

  String _buildTileText(Ingredient ingredient) {
    return '${ingredient.name} - '
        '${ingredient.count} '
        '${ingredient.type.name}';
  }
}

class _Tile extends StatelessWidget {
  final String title;

  const _Tile({
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        spacing: context.offset.normal,
        children: [
            Container(
              width: 4,
              height: double.maxFinite,
              color: context.theme.colorScheme.outline,
            ),
            Expanded(
              child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    letterSpacing: 1
                  ),
              ),
            )
        ],
      ),
    );
  }
}

