import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/pages/detail_page/bloc/recipe_detail_bloc.dart';
import 'package:recipe_browser/pages/home_page/bloc/recipe_list_bloc.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';
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
        Positioned.fill(
          child: Column(
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
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: context.offset.small,)),
                      SliverToBoxAdapter(
                        child: Text(
                            recipe.title,
                            style: context.theme.textTheme.titleMedium,
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: context.offset.small,)),
                      SliverToBoxAdapter(
                        child: SizedBox(
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
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: context.offset.normal,)),
                      SliverToBoxAdapter(child: Text(recipe.description)),
                      SliverToBoxAdapter(child: SizedBox(height: context.offset.normal,)),
                      SliverToBoxAdapter(
                        child: Divider(),
                      ),
                      SliverList.separated(
                          itemCount: recipe.ingredients.length,
                          itemBuilder: (BuildContext context, int index) => Card(
                              margin: EdgeInsets.zero,
                              child: ListTile(
                                  title: Text(
                                      _buildTileText(recipe, index)
                                  )
                              )
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                height: context.offset.normal,
                              ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: context.offset.veryLarge,),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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

        Positioned(
            right: context.offset.verySmall,
            top: context.offset.verySmall,
            child: SafeArea(
              child: IconButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        context.theme.colorScheme.surface
                    ),
                    foregroundColor: WidgetStateProperty.all(
                        context.theme.colorScheme.error
                    )
                ),
                onPressed: () => _deleteRecipe(context),
                icon: Icon(Icons.delete),
              ),
            )
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: FilledButton.tonalIcon(
            onPressed: () => context.go('/recipe/${recipe.id}/cooking'),
            icon: Icon(Icons.play_arrow),
            label: Text('Готовить!'),
          ),
        ),
      ],
    );
  }

  void _deleteRecipe(BuildContext context) {
    context.read<RecipeListBloc>().add(
        DeleteRecipe(recipe)
    );
    context.pop();
  }

  String _buildTileText(Recipe recipe, int index) {
    return '${recipe.ingredients.elementAt(index).name} - '
            '${recipe.ingredients.elementAt(index).count} '
            '${recipe.ingredients.elementAt(index).type.name}';
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


