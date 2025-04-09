import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/home/home.dart';
import 'package:recipe_browser/features/not_found/not_found.dart';

final appRouting = GoRouter(
    initialLocation: '/home',
    errorBuilder: (context, state) => NotFoundPage(),
    routes: [
        // home,
        // sets,
        // sets/:id,
        StatefulShellRoute.indexedStack(
            builder: (context, state, shell) =>
                Scaffold(
                    appBar: AppBar(),
                    body: shell,
                    bottomNavigationBar: NavigationBar(
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
                        ]
                    ),
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
            // builder: (context, state) => Center(child: Text('/recipe/${state.pathParameters['id']}')),
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
                            appBar: AppBar(),
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
                                    builder: (context, state) => Center(child: Text('/${state.pathParameters['id']}/detail')),
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
            builder: (context, state) => Center(child: Text('/create')),
            path: '/create',
            routes: [
              // create/recipe/detail, create/recipe/steps
              StatefulShellRoute.indexedStack(
                  builder: (context, state, shell) =>
                      Scaffold(
                          appBar: AppBar(),
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
                              builder: (context, state) => Center(child: Text('/create/recipe/detail')),
                              path: 'recipe/detail'
                          )
                        ]
                    ),
                    StatefulShellBranch(
                        routes: [
                          GoRoute(
                              builder: (context, state) => Center(child: Text('/create/recipe/steps')),
                              path: 'recipe/steps'
                          )
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