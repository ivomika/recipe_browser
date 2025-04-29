import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/home/home.dart';
import 'package:recipe_browser/features/layouts/layouts.dart';
import 'package:recipe_browser/features/not_found/not_found.dart';
import 'package:recipe_browser/features/recipe_detail/recipe_detail.dart';

final appRouting = GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => NotFoundPage(),
    routes: [
        // home,
        // sets,
        // sets/:id,
        StatefulShellRoute.indexedStack(
            builder: (context, state, shell) =>
                NavigationWithAppBarLayout(
                    body: shell,
                    selectedIndex: shell.currentIndex,
                    onDestinationSelected: (index) => shell.goBranch(index),
                    // bottomSheetBuilder: (context, scrollController) => HomeBottomSheet(
                    //   scrollController: scrollController
                    // ),
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
                            path: '/home'
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
        // /recipe/:id/detail,
        // /recipe/:id/steps,
        GoRoute(
            redirect: (context, state){
                if (state.fullPath == '/recipe/:id') {
                    return '/recipe/${state.pathParameters['id']}/detail';
                }

                return null;
            },
            path: '/recipe/:id',
            routes: [
                StatefulShellRoute.indexedStack(
                    builder: (context, state, shell) =>
                        Scaffold(
                            body: shell,
                            bottomNavigationBar: NavigationBar(
                                selectedIndex: shell.currentIndex,
                                onDestinationSelected: (index) => shell.goBranch(index),
                                destinations: [
                                    NavigationDestination(
                                        icon: Icon(Icons.description),
                                        label: 'Детальная'
                                    ),
                                    NavigationDestination(
                                        icon: Icon(Icons.double_arrow),
                                        label: 'Шаги'
                                    ),
                                ]
                            ),
                        ),
                    branches: [
                        StatefulShellBranch(
                            routes: [
                                GoRoute(
                                    builder: (context, state) => RecipeDetailPage(
                                      id: state.pathParameters['id']
                                    ),
                                    path: 'detail'
                                )
                            ]
                        ),
                        StatefulShellBranch(
                            routes: [
                                GoRoute(
                                    builder: (context, state) => Center(child: Text('/${state.pathParameters['id']}/steps')),
                                    path: 'steps'
                                )
                            ]
                        ),
                    ]
                ),
            ]
        ),
        // settings
        GoRoute(
            builder: (context, state) => Center(child: Text('/settings')),
            path: '/settings'
        ),
        // create,
        // create/recipe/detail,
        // create/recipe/steps,
        // create/sets,
        // create/tag,
        GoRoute(
            builder: (context, state) => CreateMenuPage(),
            path: '/create',
            routes: [
              // create/recipe/detail, create/recipe/steps
              GoRoute(
                  path: 'recipe',
                  redirect: (context, state) {
                    if (state.fullPath == '/create/recipe') {
                      return '/create/recipe/detail';
                    }

                    return null;
                  },
                  routes: [
                    StatefulShellRoute.indexedStack(
                        builder: (context, state, shell) =>
                            NavigationWithAppBarLayout(
                                body: shell,
                                selectedIndex: shell.currentIndex,
                                onDestinationSelected: (index) => shell.goBranch(index),
                                destinations: [
                                  NavigationDestination(
                                      icon: Icon(Icons.description),
                                      label: 'Детальная'
                                  ),
                                  NavigationDestination(
                                      icon: Icon(Icons.double_arrow),
                                      label: 'Шаги'
                                  ),
                                ]
                            ),
                        branches: [
                          StatefulShellBranch(
                              routes: [
                                GoRoute(
                                    builder: (context, state) => CreateRecipeDetail(),
                                    path: 'detail'
                                )
                              ]
                          ),
                          StatefulShellBranch(
                              routes: [
                                GoRoute(
                                    builder: (context, state) => CreateRecipeSteps(),
                                    path: 'steps'
                                )
                              ]
                          ),
                        ]
                    ),
                  ]
              ),
              // set
              GoRoute(
                  builder: (context, state) => Center(child: Text('/create/set')),
                  path: 'set'
              ),
              // tag
              GoRoute(
                  builder: (context, state) => Center(child: Text('/create/tag')),
                  path: 'tag'
              ),
            ]
        )
    ]
);