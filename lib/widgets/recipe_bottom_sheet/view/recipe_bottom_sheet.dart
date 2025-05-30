import 'package:flutter/material.dart';
import 'package:recipe_browser/features/animated_arrow/view/animated_arrow.dart';
import 'package:recipe_browser/features/recipe_list/recipe_list.dart';
import 'package:recipe_browser/features/recipe_tile/recipe_tile.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class RecipeBottomSheet extends StatefulWidget {
  const RecipeBottomSheet({super.key});

  @override
  State<RecipeBottomSheet> createState() => _RecipeBottomSheetState();
}

class _RecipeBottomSheetState extends State<RecipeBottomSheet> {
  late final SheetController _sheetController;

  @override
  void initState() {
    super.initState();
    _sheetController = SheetController();
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return SheetViewport(
          padding: EdgeInsets.only(top: 145),
          child: Sheet(
              controller: _sheetController,
              decoration: MaterialSheetDecoration(
                  size: SheetSize.stretch,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                        context.offset.veryLarge + context.offset.normal),
                  ),
                  color: context.theme.colorScheme.surface,
                  elevation: 4,
                  clipBehavior: Clip.antiAlias),
              snapGrid: const SheetSnapGrid(
                snaps: [SheetOffset(0.8), SheetOffset(1)],
              ),
              scrollConfiguration: const SheetScrollConfiguration(),
              child: Column(
                children: [
                  AnimatedArrow(
                      sheet: _sheetController
                  ),
                  Expanded(
                    child: RecipeList(
                        itemBuilder: (context, index, state) => RecipeTile(
                            recipe: state.recipes.elementAt(index)
                        ),
                        skeletonBuilder: (context, index) => RecipeTileSkeleton()
                    ),
                  ),
                ],
              )
          )
      );
  }
}
