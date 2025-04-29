import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:recipe_browser/features/recipe/view/recipe_tile.dart';
import 'package:recipe_browser/features/theme/extension/theme_context_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBottomSheet extends StatelessWidget {
  // final ScrollController scrollController;
  const HomeBottomSheet({
    super.key,
    // required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadingRecipes());

    return DraggableScrollableSheet(
      builder: (context, scrollController) => Container(
        padding: EdgeInsets.only(top: context.offset.normal),
        decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                  context.offset.veryLarge + context.offset.normal),
            )),
        child: CustomScrollView(controller: scrollController, slivers: [
          SliverPadding(
              padding: EdgeInsets.all(context.offset.normal).copyWith(top: 0),
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
                      // Container(
                      //   width: 382,
                      //   height: 286,
                      //   decoration: BoxDecoration(
                      //       color: context.theme.colorScheme.outline,
                      //       borderRadius: BorderRadius.circular(
                      //           context.offset.veryLarge
                      //       )
                      //   ),
                      // ),
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
        ]),
      ),
      snap: true,
      snapSizes: [
        0.65,
        0.78,
      ],
      maxChildSize: 0.78,
      minChildSize: 0.65,
      initialChildSize: 0.78,
    );
  }
}
