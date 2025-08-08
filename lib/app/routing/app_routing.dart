import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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