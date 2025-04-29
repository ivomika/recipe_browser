import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/home/home.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:recipe_browser/features/theme/extension/theme_context_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      onTap: () => context.read<RecipeBloc>().add(LoadingRecipes()),
                      hintText: 'Поиск...',
                      leading: Icon(
                        Icons.search_outlined
                      ),
                    ),
                    SizedBox(
                      height: context.offset.normal,
                    ),
                    FilledButton(
                        onPressed: () => context.push('/create'),
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
        HomeBottomSheet(),
      ],
    );
  }
}
