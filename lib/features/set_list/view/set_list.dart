import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/set_list/set_list.dart';
import 'package:recipe_browser/shared/models/models.dart';

class SetList extends StatelessWidget {
  final Widget Function(Set set) itemBuilder;
  const SetList({
    super.key,
    required this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetListBloc, SetListState>(builder: (context, state) {
      switch (state) {
        case SetListInitial() || SetListLoading():
          return Center(
            child: CircularProgressIndicator(),
          );
        case SetListLoaded():
          return CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return itemBuilder.call(state.sets.elementAt(index));
                  },
                  childCount: state.sets.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 228,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
              ),
            ],
          );
        case SetListError():
          return Center(
            child: Text(state.error),
          );
      }
    });
  }
}
