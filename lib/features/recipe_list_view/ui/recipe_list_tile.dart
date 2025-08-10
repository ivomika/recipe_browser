import 'package:flutter/material.dart';

class RecipeListTile extends StatelessWidget {
  final String title;

  const RecipeListTile({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}
