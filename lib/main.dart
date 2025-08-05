import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/app/storage/drift/tabels/recipe/repository/drift_recipe_repository.dart';
import 'package:recipe_browser/app/theme/theme.dart';
import 'package:recipe_browser/app/routing/app_routing.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //remove # from url
  // setPathUrlStrategy();
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider(
        //     create: (context) => DriftAppDatabase()
        // ),
        // RepositoryProvider<IRecipeRepository>(
        //     create: (context) => DriftRecipeRepository(
        //       context.read<DriftAppDatabase>()
        //     )
        // )
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