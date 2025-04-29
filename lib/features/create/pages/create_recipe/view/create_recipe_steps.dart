import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateRecipeSteps extends StatelessWidget {
  const CreateRecipeSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: BackButton(
            onPressed: () => context.pop(),
          ),
          title: Text('Новый рецепт'),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Text('Тут ничего нет...'),
          ),
        )
      ],
    );
  }
}
