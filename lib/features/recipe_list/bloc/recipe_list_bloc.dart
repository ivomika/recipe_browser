import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final IRecipeRepository _repository;

  RecipeListBloc(IRecipeRepository repository) : _repository = repository, super(RecipeInitial()) {
    on<LoadingRecipes>(_loadingRecipes);
    on<DeleteRecipe>(_deleteRecipe);
  }

  FutureOr<void> _loadingRecipes(LoadingRecipes event, Emitter<RecipeListState> emit) async {
    emit(RecipeLoading());

    await Future.delayed(Duration(seconds: 2));
    try{
      final recipes = await _repository.all();
      emit(RecipeLoaded(recipes: recipes.reversed.toList(growable: false)));
    } catch (e){
      emit(RecipeError(error: e.toString()));
    }
  }

  FutureOr<void> _deleteRecipe(DeleteRecipe event, Emitter<RecipeListState> emit) async {
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
