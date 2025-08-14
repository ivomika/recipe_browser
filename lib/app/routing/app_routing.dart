import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/pages/create_recipe/create_recipe.dart';
import 'package:recipe_browser/pages/home_page/home_page.dart';

final appRouting = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Placeholder(),
    routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, shell) => shell,
            branches: [
                StatefulShellBranch(
                    routes: [
                        GoRoute(
                            builder: (context, state) => HomePage(),
                            path: '/',
                            routes: [
                              GoRoute(
                                  path: 'create-recipe',
                                  builder: (context, state) => CreateRecipe()
                              )
                            ]
                        )
                    ]
                ),
                StatefulShellBranch(
                    routes: [
                        GoRoute(
                            builder: (context, state) => Placeholder(),
                            path: '/collections',
                        )
                    ]
                ),
            ],
        ),
    ]
);