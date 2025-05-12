import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/pages/pages.dart';
import 'package:recipe_browser/shared/layouts/layouts.dart';

final appRouting = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => NotFoundPage(),
    routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, shell) =>
                BottomNavigationLayout(
                    body: shell,
                    selectedIndex: shell.currentIndex,
                    onDestinationSelected: (index) => shell.goBranch(index),
                    destinations: [
                      NavigationDestination(
                          icon: Icon(Icons.home),
                          label: 'Главная'
                      ),
                      NavigationDestination(
                          icon: Icon(Icons.list_alt),
                          label: 'Сеты'
                      ),
                    ],
                ),
            branches: [
                StatefulShellBranch(
                    routes: [
                        GoRoute(
                            builder: (context, state) => HomePage(),
                            path: '/',
                            routes: [
                                GoRoute(
                                    path: 'create',
                                    builder: (context, state) => CreatePage(),
                                    routes: [
                                      GoRoute(
                                        path: 'recipe',
                                        builder: (context, state) => CreateRecipeDetail(),
                                      )
                                    ]
                                ),
                                GoRoute(
                                    path: 'recipe/:id',
                                    builder: (context, state) => RecipeDetailPage(
                                      id: state.pathParameters['id'],
                                    ),
                                    routes: [
                                      GoRoute(
                                          path: 'cooking',
                                          builder: (context, state) => RecipeCookingPage(
                                              id: state.pathParameters['id']
                                          ),
                                      )
                                    ]
                                )
                            ]
                        )
                    ]
                ),
                StatefulShellBranch(
                    routes: [
                        GoRoute(
                            builder: (context, state) => Center(child: Text('/sets')),
                            path: '/sets',
                            routes: [
                                GoRoute(
                                    builder: (context, state) => Center(child: Text('/sets/${state.pathParameters['id']}')),
                                    path: ':id'
                                )
                            ]
                        )
                    ]
                ),
            ],
        ),
    ]
);