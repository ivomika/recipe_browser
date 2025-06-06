import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/features/recipe_list/recipe_list.dart';
import 'package:recipe_browser/features/routing/app_routing.dart';
import 'package:recipe_browser/features/set_list/set_list.dart';
import 'package:recipe_browser/features/theme/theme.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';
import 'package:recipe_browser/widgets/recipe_info/recipe_info.dart';
import 'package:recipe_browser/widgets/set_info/set_info.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //remove # from url
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DriftAppDatabase>(
          create: (context) => DriftAppDatabase(),
        ),
        RepositoryProvider<IRecipeRepository>(
          create: (context) => DriftRecipeRepository(context.read<DriftAppDatabase>()),
        ),
        RepositoryProvider<ISetRepository>(
          create: (context) => DriftSetRepository(context.read<DriftAppDatabase>())
        ),
        BlocProvider<RecipeListBloc>(
          create: (context) => RecipeListBloc(
              context.read<IRecipeRepository>()
          )..add(LoadingRecipes())
        ),
        BlocProvider<SetListBloc>(
          create: (context) => SetListBloc(
              context.read<ISetRepository>()
          )..add(LoadingSetList())
        ),
        BlocProvider<RecipeDetailBloc>(
          create: (context) => RecipeDetailBloc(
              context.read<IRecipeRepository>(),
              context.read<ISetRepository>(),
          )
        ),
        BlocProvider<SetDetailBloc>(
          create: (context) => SetDetailBloc(
              context.read<ISetRepository>(),
              context.read<IRecipeRepository>(),
          )
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: AppTheme.light.copyWith(
          extensions: [
            OffsetThemeExtension(
                verySmall: 4,
                small: 8,
                normal: 16,
                large: 24,
                veryLarge: 32
            )
          ]
        ),
        darkTheme: AppTheme.dark.copyWith(
            extensions: [
              OffsetThemeExtension(
                  verySmall: 4,
                  small: 8,
                  normal: 16,
                  large: 24,
                  veryLarge: 32
              )
            ]
        ),
        routerConfig: appRouting,
      ),
    );
  }
}