import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/recipe/models/recipe.dart';
import 'package:recipe_browser/features/recipe_detail/bloc/recipe_detail_bloc.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class RecipeDetailPage extends StatelessWidget {
  final String? id;

  const RecipeDetailPage({
    super.key,
    this.id
  });

  @override
  Widget build(BuildContext context) {
    context.read<RecipeDetailBloc>().add(LoadingRecipeDetail(id!));

    return BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
      builder: (context, state) {
        switch (state) {
          case RecipeDetailInitial():
            return Center(
              child: CircularProgressIndicator(),
            );
          case RecipeDetailLoading():
            return Center(
              child: CircularProgressIndicator(),
            );
          case RecipeDetailLoaded():
            return _LoadedState(
                recipe: state.recipe
            );
          case RecipeDetailError():
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      }
    );
  }
}

class _LoadedState extends StatelessWidget {
  final Recipe recipe;

  const _LoadedState({
    required this.recipe
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 220,

                child: Image.network(
                    fit: BoxFit.cover,
                    'https://placehold.co/500x500/png'
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.offset.normal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.offset.small,),
                        Text(
                            recipe.title,
                            style: context.theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: context.offset.small,),
                        SizedBox(
                          height: 24,
                          width: double.maxFinite,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: Row(
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
                            ),
                          ),
                        ),
                        SizedBox(height: context.offset.normal,),
                        Text(recipe.description)
                      ],
                    ),
                  )
              )
            ],
          ),
        ),

        Positioned(
            left: context.offset.normal,
            top: 0,
            child: SafeArea(
              child: BackButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    context.theme.colorScheme.surface
                  ),
                  foregroundColor: WidgetStateProperty.all(
                      context.theme.colorScheme.onSurface
                  )
                ),
                onPressed: () => context.pop(),
              ),
            )
        ),
      ],
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


