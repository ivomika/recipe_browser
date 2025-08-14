import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';

class ChoiceCreate extends StatelessWidget {
  const ChoiceCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FilledButton(
                  onPressed: () => GoRouter.of(context).go('/create/count-type'),
                  child: Text('Добавить тип')
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: context.offset.normal,)
            ),
            SliverToBoxAdapter(
              child: FilledButton(
                  onPressed: () => GoRouter.of(context).go('/create/recipe'),
                  child: Text('Добавить рецепт')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
