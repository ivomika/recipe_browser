import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/features/recipe/bloc/recipe_bloc.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/routing/app_routing.dart';

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
        BlocProvider<RecipeBloc>(
          create: (context) => RecipeBloc(context.read<IRecipeRepository>())
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouting,
      ),
    );
  }
}