import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/recipe_image/recipe_image.dart';
import 'package:recipe_browser/features/recipe_list/recipe_list.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:recipe_browser/widgets/recipe_info/recipe_info.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipeDetailPage extends StatefulWidget {
  final String? id;

  const RecipeDetailPage({
    super.key,
    this.id
  });

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeDetailBloc>().add(LoadingRecipeDetail(widget.id!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
      builder: (context, state) {
        switch (state) {
          case RecipeDetailInitial():
            return Center(
              child: CircularProgressIndicator(),
            );
          case RecipeDetailLoading():
            return Skeletonizer(
                child: _LoadedState(
                    recipe: Recipe(
                        id: '',
                        createdAt: DateTime.now(),
                        title: BoneMock.words(10),
                        description: BoneMock.words(50),
                        cookingTime: 60,
                        kilocalories: 600,
                        ingredients: List.generate(
                            10,
                            (index) => Ingredient(
                                name: BoneMock.words(1),
                                count: 10,
                                type: CountType.gram
                            )
                        ),
                        cookingSteps: []
                    )
                )
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
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: RecipeImage(
                recipe: recipe
            )
        ),
        Positioned(
          top: 220,
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            children: [
              Expanded(
                  child: RecipeInfo(recipe: recipe)
              ),
              Padding(
                padding: EdgeInsets.all(context.offset.normal),
                child: Row(
                  // spacing: context.offset.normal,
                  children: [
                    Expanded(
                        child: FilledButton.tonalIcon(
                          onPressed: () => context.go('/recipe/${recipe.id}/cooking'),
                          icon: Icon(Icons.play_arrow),
                          label: Text('Готовить!'),
                        ),
                    ),
                    PopupMenuButton(
                        itemBuilder: (popContext) => [
                          PopupMenuItem(
                              onTap: () => _deleteRecipe(context),
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Удалить'),
                              )
                          ),
                          PopupMenuItem(
                              enabled: false,
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Редактировать'),
                              )
                          ),
                        ]
                    )
                  ],
                ),
              )
            ],
          )
        ),

        Positioned(
            left: context.offset.verySmall,
            top: context.offset.verySmall,
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

  void _deleteRecipe(BuildContext context) {
    context.read<RecipeDetailBloc>().add(
        DeleteRecipeDetail(recipe)
    );
    context.read<RecipeListBloc>().add(
        LoadingRecipes()
    );
    context.pop();
  }
}


