import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              title: Text('Что Вас интересует?'),
          ),
          SliverPadding(
            padding: EdgeInsets.all(context.offset.normal),
            sliver: SliverToBoxAdapter(
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.offset.normal
                  ),
                  child: Column(
                    children: [
                      _Tile(
                          title: 'Рецепт',
                          onTap: () => context.go('/create/recipe'),
                      ),
                      _Tile(
                          title: 'Сет',
                          enabled: false,
                      ),
                      _Tile(
                        title: 'Тег',
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  final bool enabled;
  final VoidCallback? onTap;

  const _Tile({
    required this.title,
    this.onTap,
    this.enabled = true
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled,
      leading: SizedBox.square(
        dimension: 42,
        child: Placeholder(),
      ),
      title: Text(title,),
      onTap: onTap,
    );
  }
}

