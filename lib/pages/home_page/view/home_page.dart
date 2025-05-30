import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/recipe_list/recipe_list.dart';
import 'package:recipe_browser/utils/extensions/theme_context_extension.dart';
import 'package:recipe_browser/widgets/recipe_bottom_sheet/view/recipe_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              AppBar(
                title: Text('Кухня в кармане'),
              ),
              Padding(
                  padding: EdgeInsets.all(context.offset.normal),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SearchBar(
                        onTap: () => context.read<RecipeListBloc>().add(LoadingRecipes()),
                        hintText: 'Поиск...',
                        leading: Icon(
                          Icons.search_outlined
                        ),
                      ),
                      SizedBox(
                        height: context.offset.normal,
                      ),
                      FilledButton(
                          onPressed: () => context.go('/create'),
                          child: Text('Добавить')
                      ),
                      SizedBox(
                        height: context.offset.small,
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text('Настройки')
                      )
                    ],
                  ),
              )
            ],
          ),
          RecipeBottomSheet(),
        ],
      ),
    );
  }
}
