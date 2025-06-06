import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:recipe_browser/widgets/create_forms/recipe/bloc/create_recipe_cubit.dart';

class CreateFormRecipeDetail extends StatelessWidget {
  const CreateFormRecipeDetail({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              suffixText: 'ккал/100 гр.'
          ),
          keyboardType: TextInputType.number,
          validator: _kilocaloriesValidator,
          onSaved: (value) => _kilocaloriesSave(value, context),
        ),
        SizedBox(
          height: context.offset.normal,
        ),
      ],
    );
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
      return 'Килокалории должны быть заполнены';
    }

    return null;
  }

  void _kilocaloriesSave(String? newValue, BuildContext context) {
    context.read<CreateRecipeCubit>().state.data.kilocalories = int.parse(newValue!);
  }
}