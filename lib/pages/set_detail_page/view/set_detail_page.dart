import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/recipe_tile/recipe_tile.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:recipe_browser/widgets/set_info/set_info.dart';

class SetDetailPage extends StatefulWidget {
  final String? id;

  const SetDetailPage({
    super.key,
    this.id,
  });

  @override
  State<SetDetailPage> createState() => _SetDetailPageState();
}

class _SetDetailPageState extends State<SetDetailPage> {
  @override
  void initState() {
    context.read<SetDetailBloc>().add(LoadingSetDetail(widget.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetDetailBloc, SetDetailState>(
        builder: (context, state){
          switch(state){
            case SetDetailInitial() || SetDetailLoading():
              return Center(
                child: CircularProgressIndicator(),
              );
            case SetDetailLoaded():
              if(state.recipes.isEmpty){
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text(state.set.title),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 200,
                        child: Center(child: Text('Тут все еще пусто...')),
                      ),
                    )
                  ],
                );
              }
              
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(state.set.title),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(context.offset.normal),
                    sliver: SliverList.builder(
                        itemCount: state.recipes.length,
                        itemBuilder: (context, index) {
                          return RecipeTile(
                              recipe: state.recipes.elementAt(index),
                              onTap: () => context.push('/recipe/${state.recipes.elementAt(index).id}'),
                          );
                        }
                    ),
                  )
                ],
              );
            case SetDetailError():
              return Center(
                child: Text(state.error),
              );
          }
        }
    );
  }
}
