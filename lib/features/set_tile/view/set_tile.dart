import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class SetTile extends StatelessWidget {
  final Set set;
  const SetTile({
    super.key,
    required this.set
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 250,
        maxWidth: 200,
        minHeight: 100,
        minWidth: 100
      ),
      child: Material(
        borderRadius: BorderRadius.circular(
          context.offset.veryLarge
        ),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => context.go('/sets/${set.id}'),
          child: Center(
            child: Text(set.title),
          ),
        ),
      ),
    );
  }
}
