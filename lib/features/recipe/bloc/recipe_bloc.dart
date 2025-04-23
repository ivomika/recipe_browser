import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final IRecipeRepository _repository;

  RecipeBloc(IRecipeRepository repository) : _repository = repository, super(RecipeInitial()) {
    on<LoadingRecipes>(_loadingRecipes);
    on<CreateRecipe>(_createRecipe);
  }

  FutureOr<void> _loadingRecipes(LoadingRecipes event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());

    await Future.delayed(Duration(seconds: 4));
    try{
      final recipes = await _repository.all();
      emit(RecipeLoaded(recipes: recipes));
    } catch (e){
      emit(RecipeError(error: e.toString()));
    }
  }

  FutureOr<void> _createRecipe(CreateRecipe event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());

    await Future.delayed(Duration(seconds: 4));
    try{
      await _repository.create(event.recipe);
      final recipes = await _repository.all();
      emit(RecipeLoaded(recipes: recipes));
    }catch(e){
      emit(RecipeError(error: e.toString()));
    }
  }
}
