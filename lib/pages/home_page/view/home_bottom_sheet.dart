import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/pages/home_page/bloc/recipe_list_bloc.dart';
import 'package:recipe_browser/utils/extensions/theme_context_extension.dart';
import 'package:recipe_browser/widgets/recipe_tile/recipe_tile.dart';
import 'package:recipe_browser/widgets/recipe_tile/recipe_tile_skeleton.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({
    super.key,
  });

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  late final SheetController _sheetController;

  @override
  void initState() {
    super.initState();
    _sheetController = SheetController();
    context.read<RecipeListBloc>().add(LoadingRecipes());
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
            child: _Sheet(
              sheet: _sheetController,
            )));
  }
}

class _Sheet extends StatelessWidget {
  final SheetController sheet;

  const _Sheet({required this.sheet});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: _AnimationArrow(sheet: sheet)),
      SliverPadding(
          padding: EdgeInsets.all(context.offset.normal).copyWith(top: 0),
          sliver:
              BlocBuilder<RecipeListBloc, RecipeListState>(builder: (context, state) {
            switch (state) {
              case RecipeInitial():
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('Добавьте что нибудь новенькое!'),
                    ),
                  ),
                );
              case RecipeLoading():
                return SliverList.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) => RecipeTileSkeleton(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: context.offset.normal,
                  ),
                );
              case RecipeLoaded():
                if (state.recipes.isEmpty) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: Text('Добавьте что нибудь новенькое!'),
                      ),
                    ),
                  );
                }

                return SliverList.separated(
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) => RecipeTile(
                    recipe: state.recipes.elementAt(index),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: context.offset.normal,
                  ),
                );
              case RecipeError():
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
            }
          }))
    ]);
  }
}

class _AnimationArrow extends StatefulWidget {
  final SheetController sheet;

  const _AnimationArrow({required this.sheet});

  @override
  State<_AnimationArrow> createState() => _AnimationArrowState();
}

class _AnimationArrowState extends State<_AnimationArrow> {
  late double _animationValue;

  @override
  void initState() {
    super.initState();
    _animationValue = 0;
    widget.sheet.addListener(_animationListener);
  }

  @override
  void dispose() {
    widget.sheet.removeListener(_animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _animationValue,
      duration: Duration(microseconds: 10),
      child: Icon(
        size: 48,
        Icons.keyboard_arrow_up,
        color: context.theme.colorScheme.onSurface.withAlpha(60),
      ),
    );
  }

  double normalize(
    double value, {
    required double sourceMin,
    required double sourceMax,
    double targetMin = 0.0,
    double targetMax = 0.5,
  }) {
    // Обработка случая, когда исходный диапазон невалиден
    if (sourceMin == sourceMax) return targetMin;
    if (value > sourceMax) return targetMax;
    if (value < sourceMin) return targetMin;

    // Вычисление нормализованного значения
    final double ratio = (value - sourceMin) / (sourceMax - sourceMin);
    return ratio * (targetMax - targetMin) + targetMin;
  }

  void _animationListener() {
    setState(() => _animationValue = normalize(
          widget.sheet.value ?? 0,
          sourceMin: widget.sheet.metrics?.minOffset ?? 0,
          sourceMax: widget.sheet.metrics?.maxOffset ?? 1,
        )
    );
  }
}
