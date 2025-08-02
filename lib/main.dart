import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/app/theme/theme.dart';
import 'package:recipe_browser/app/routing/app_routing.dart';
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