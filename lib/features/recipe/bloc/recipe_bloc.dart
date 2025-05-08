import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
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
    on<DeleteRecipe>(_deleteRecipe);
  }

  FutureOr<void> _loadingRecipes(LoadingRecipes event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());

    await Future.delayed(Duration(seconds: 4));
    try{
      final recipes = await _repository.all();
      emit(RecipeLoaded(recipes: recipes.reversed.toList(growable: false)));
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

  FutureOr<void> _deleteRecipe(DeleteRecipe event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());

    await Future.delayed(Duration(seconds: 4));
    try{
      final result = await _repository.delete(event.recipe);
      if(result == false) throw InvalidDataException('Нет подходящего объекта для удаления');

      final recipes = await _repository.all();
      emit(RecipeLoaded(recipes: recipes));
    }catch(e){
      emit(RecipeError(error: e.toString()));
    }
  }
}
