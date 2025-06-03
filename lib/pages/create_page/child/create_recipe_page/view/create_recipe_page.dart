import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/recipe_list/recipe_list.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:recipe_browser/widgets/create_forms/create_forms.dart';

class CreateRecipePage extends StatelessWidget {
  final void Function(int index) onTabTap;
  final Widget child;

  const CreateRecipePage(
      {super.key, required this.onTabTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRecipeCubit(
          GlobalKey<FormState>(), context.read<IRecipeRepository>()),
      child: Builder(builder: (context) {
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: BackButton(
                      onPressed: () => context.pop(),
                    ),
                    title: Text('Новый рецепт'),
                    floating: true,
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(64),
                      child: TabBar(onTap: onTabTap, tabs: [
                        Tab(
                          text: 'Детали',
                        ),
                        Tab(
                          text: 'Ингредиенты',
                        ),
                        Tab(
                          text: 'Шаги',
                        ),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Form(
                          key: context.read<CreateRecipeCubit>().formKey,
                          child: child))
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FilledButton(
                    onPressed: () => _formSubmit(context),
                    child: Text('Сохранить')),
              )
            ],
          ),
        );
      }),
    );
  }

  void _formSubmit(BuildContext context) {
    final createCubit = context.read<CreateRecipeCubit>();
    final errors = createCubit.formKey.currentState!
        .validateGranularly()
        .where((e) => e.hasError)
        .map((e) => e.errorText)
        .toList(growable: false);

    if (errors.isNotEmpty) {
      for (var error in errors) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              content: Row(
                spacing: context.offset.normal,
                children: [
                  Icon(
                    Icons.error,
                    color: context.theme.colorScheme.error,
                  ),
                  Expanded(
                    child: Text(
                      error!,
                      style: TextStyle(
                          color: context.theme.colorScheme.error,
                          overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: context.theme.colorScheme.errorContainer,
            )
        );
      }
      return;
    }

    createCubit.formKey.currentState!.save();
    createCubit.create();

    context.read<RecipeListBloc>().add(LoadingRecipes());
    context.go('/');
  }
}
