import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';
import 'package:recipe_browser/widgets/create_forms/recipe/model/create_recipe_model.dart';

part 'create_recipe_state.dart';

class CreateRecipeCubit extends Cubit<CreateRecipeState> {
  final GlobalKey<FormState> formKey;
  final IRecipeRepository _recipeRepository;

  CreateRecipeCubit(
      this.formKey,
      IRecipeRepository recipeRepository
      ) : _recipeRepository = recipeRepository, super(
      CreateRecipeInitial(
          CreateRecipeModel(
            ingredients: [],
            cookingSteps: []
          )
      )
  );

  FutureOr<void> create() async {
    try{
      print(state.data);
      await _recipeRepository.create(
        Recipe.create(
            title: state.data.title!,
            description: state.data.description!,
            cookingTime: state.data.cookingTime!,
            kilocalories: state.data.kilocalories!,
            ingredients: state.data.ingredients!.map(
                (e) =>
                    Ingredient(
                        name: e.name!,
                        count: e.count!,
                        type: e.type!
                    )
            ).toList(growable: false),
            cookingSteps: state.data.cookingSteps!.map(
                (e) => CookingStep(
                    description: e.description!
                )
            ).toList(growable: false)
        )
      );
    }catch(e){
      emit(CreateRecipeError(
          e.toString(),
          state.data
      ));
    }
  }
}
