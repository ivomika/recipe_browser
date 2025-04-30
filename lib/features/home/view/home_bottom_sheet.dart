import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:recipe_browser/features/theme/extension/theme_context_extension.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadingRecipes());
    return SheetViewport(
      padding: EdgeInsets.only(top: 145),
      child: Sheet(
        decoration: MaterialSheetDecoration(
          size: SheetSize.stretch,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              context.offset.veryLarge + context.offset.normal
            ),
          ),
          color: context.theme.colorScheme.surface,
          elevation: 4,
          clipBehavior: Clip.antiAlias
        ),
        snapGrid: const SheetSnapGrid(
          snaps: [SheetOffset(0.8), SheetOffset(1)],
        ),
        scrollConfiguration: const SheetScrollConfiguration(),
        child: _Sheet()
      )
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPadding(
          padding: EdgeInsets.all(context.offset.normal),
          sliver: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                switch (state) {
                  case RecipeInitial():
                    return SliverFillRemaining(
                      child: Center(
                        child: Text('Добавьте что нибудь новенькое!'),
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
                      return SliverFillRemaining(
                        child: Center(
                          child: Text('Нет данных'),
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
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                }
              }))
    ]);
  }
}

