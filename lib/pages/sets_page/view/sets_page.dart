import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/set_list/set_list.dart';
import 'package:recipe_browser/features/set_list/view/set_list.dart';
import 'package:recipe_browser/features/set_tile/set_tile.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class SetsPage extends StatelessWidget {
  const SetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<SetListBloc>().add(LoadingSetList());
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Кухня в кармане'),
          ),
          SliverPadding(
            padding: EdgeInsets.all(context.offset.normal),
            sliver: SliverFillRemaining(
              child: SetList(
                itemBuilder: (Set set) {
                  return SetTile(set: set);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
