import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/create/create.dart';
import 'package:recipe_browser/features/create/pages/create_recipe/bloc/create_recipe_cubit.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class CreateRecipeDetail extends StatelessWidget {
  const CreateRecipeDetail({super.key});

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
            child: BlocProvider(
              create: (context) => CreateRecipeCubit(
                GlobalKey<FormState>(),
                context.read<IRecipeRepository>()
              ),
              child: _Form(),
            )
        ),
      ],
    );
  }
}


class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<CreateRecipeCubit>().formKey,
        child: Padding(
          padding: EdgeInsets.all(
              context.offset.normal
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // title
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Название',
                    hintText: 'Крабовый салат'
                ),
                validator: _titleValidator,
                onSaved: (value) => _titleSave(value, context),
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              // description
              TextFormField(
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: 'Описание',
                    hintText: 'Дополнительная информация для Вас!'
                ),
                onSaved: (value) => _descriptionSave(value, context),
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              // cooking time
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Время готовки',
                    hintText: '60',
                    suffixText: 'мин.'
                ),
                keyboardType: TextInputType.number,
                validator: _cookingTimeValidator,
                onSaved: (value) => _cookingTimeSave(value, context),
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              // kilocalories
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Килокалории',
                    hintText: '565',
                    suffixText: 'ккал'
                ),
                keyboardType: TextInputType.number,
                validator: _kilocaloriesValidator,
                onSaved: (value) => _kilocaloriesSave(value, context),
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              Divider(),
              SizedBox(
                height: context.offset.normal,
              ),
              IngredientListInput(),
              SizedBox(
                height: context.offset.normal,
              ),
              Divider(),
              SizedBox(
                height: context.offset.normal,
              ),
              FilledButton(
                  onPressed: () => _formSubmit(context),
                  child: Text('Добавить')
              ),
            ],
          ),
        )
    );
  }

  void _formSubmit(BuildContext context) {
    final createCubit = context.read<CreateRecipeCubit>();
    if (createCubit.formKey.currentState!.validate() == false) return;

    createCubit.formKey.currentState!.save();
    createCubit.create();

    context.go('/home');
  }

  String? _titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Название должно быть заполнено';
    }

    return null;
  }

  void _titleSave(String? newValue, BuildContext context) {
    context.read<CreateRecipeCubit>().state.data.title = newValue!;
  }

  void _descriptionSave(String? newValue, BuildContext context) {
    context.read<CreateRecipeCubit>().state.data.description = newValue ?? '';
  }

  String? _cookingTimeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Время готовки должно быть заполнено';
    }

    return null;
  }

  void _cookingTimeSave(String? newValue, BuildContext context) {
    context.read<CreateRecipeCubit>().state.data.cookingTime = int.parse(newValue!);
  }

  String? _kilocaloriesValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Килокалории должны быть заполнено';
    }

    return null;
  }

  void _kilocaloriesSave(String? newValue, BuildContext context) {
    context.read<CreateRecipeCubit>().state.data.kilocalories = int.parse(newValue!);
  }
}
