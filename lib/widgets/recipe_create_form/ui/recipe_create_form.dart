import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/state_form/bloc/state_form_cubit.dart';
import 'package:recipe_browser/features/state_form/ui/state_form.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';
import 'package:recipe_browser/widgets/recipe_create_form/ui/cooking_step_list_input.dart';
import 'package:recipe_browser/widgets/recipe_create_form/ui/ingredient_list_input.dart';

import '../../../entities/entities.dart';

class RecipeCreateForm extends StatelessWidget {
  final Function(Map<String, dynamic> data) onSave;

  const RecipeCreateForm({
    super.key,
    required this.onSave
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StateFormCubit(
        onSaveForm: onSave
      ),
      child: StateForm(
          children: [
            _Info(),
            SizedBox(
                height: context.offset.normal
            ),
            _Ingredients(),
            SizedBox(
              height: context.offset.normal,
            ),
            _CookingSteps(),
            SizedBox(
              height: context.offset.normal,
            ),
            Builder(
              builder: (context) {
                return FilledButton(
                    onPressed: () => context.read<StateFormCubit>().save(),
                    child: Text('Сохранить')
                );
              }
            )
          ]
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StateFormCubit>();

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(context.offset.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: context.offset.normal,
          children: [
            Text('Общая информация'),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Название'
              ),
              validator: (text) {
                if(text == null || text.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (value) => bloc.addField(
                  'title',
                  value
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Описание'
              ),
              validator: (text) {
                if(text == null || text.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (value) => bloc.addField
                (
                  'description',
                  value
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Время готовки'
              ),
              validator: (text) {
                if(text == null || text.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (value) => bloc.addField
                (
                  'cookingTime',
                  int.parse(value!)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Калории'
              ),
              validator: (text) {
                if(text == null || text.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (value) => bloc.addField
                (
                  'kilocalories',
                  int.parse(value!)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Кол-во порций'
              ),
              validator: (text) {
                if(text == null || text.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (value) => bloc.addField
                (
                  'servings',
                  int.parse(value!)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Сложность'
              ),
              validator: (text) {
                if(text == null || text.isEmpty){
                  return 'Пусто';
                }

                return null;
              },
              onSaved: (value) => bloc.addField
                (
                  'difficulty',
                  value
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Ingredients extends StatelessWidget {
  const _Ingredients();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(context.offset.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: context.offset.normal,
          children: [
            Text('Ингредиенты'),
            IngredientListInput(
              onSaved: (List<Ingredient> value) => context.read<StateFormCubit>().addField(
                  'ingredients',
                  value
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CookingSteps extends StatelessWidget {
  const _CookingSteps();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(context.offset.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: context.offset.normal,
          children: [
            Text('Шаги приготовления'),
            CookingStepListInput(
              onSaved: (List<String> value) => context.read<StateFormCubit>().addField(
                  'cookingSteps',
                  value.map((e) => CookingStep(description: e)).toList(growable: false)
              ),
            )
          ],
        ),
      ),
    );
  }
}


