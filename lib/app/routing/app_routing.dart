import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                            builder: (context, state) => Placeholder(),
                            path: '/',
                        )
                    ]
                ),
                StatefulShellBranch(
                    routes: [
                        GoRoute(
                            builder: (context, state) => Placeholder(),
                            path: '/group',
                        )
                    ]
                ),
            ],
        ),
    ]
);