import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/recipe_list/recipe_list.dart';
import 'package:recipe_browser/utils/utils.dart';

class RecipeList extends StatelessWidget {
  final RecipeItemBuilder itemBuilder;
  final RecipeSkeletonBuilder skeletonBuilder;

  const RecipeList({
    super.key,
    required this.itemBuilder,
    required this.skeletonBuilder
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListBloc, RecipeListState>(
        builder: (context, state) {
          switch(state){
            case RecipeInitial() || RecipeLoading():
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(
                        context.offset.normal
                    ).copyWith(top: 0),
                    sliver: SliverList.separated(
                      itemCount: 10,
                      itemBuilder: skeletonBuilder,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: context.offset.normal,
                          ),
                    ),
                  )
                ],
              );
            case RecipeLoaded():
              if(state.recipes.isEmpty){
                return SizedBox(
                  height: 500,
                  child: Center(
                    child: Text('Скоро будем... Готовим рецепты!'),
                  ),
                );
              }

              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(
                      context.offset.normal
                    ).copyWith(top: 0),
                    sliver: SliverList.separated(
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) => itemBuilder(context, index, state),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: context.offset.normal,
                          ),
                    ),
                  )
                ],
              );
            case RecipeError():
              return SizedBox(
                height: 500,
                child: Center(
                  child: Text('Что то случилось...'),
                ),
              );
          }
        }
    );
  }
}
