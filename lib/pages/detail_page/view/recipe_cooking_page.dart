import 'package:flutter/material.dart';

class RecipeCookingPage extends StatelessWidget {
  final String? id;

  const RecipeCookingPage({
    super.key,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Готовим!'),
        )
      ],
    );
  }
}
