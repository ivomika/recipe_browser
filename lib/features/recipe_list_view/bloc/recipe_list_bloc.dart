import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_browser/entities/entities.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final IRecipeRepository _repository;

  RecipeListBloc(this._repository) : super(RecipeListInitial()) {
    on<LoadingRecipeList>(_loadingRecipeList);
  }

  FutureOr<void> _loadingRecipeList(LoadingRecipeList event, Emitter<RecipeListState> emit) async {
    emit(RecipeListLoading());
    try{
      final recipes = await _repository.find(event.query);
      emit(RecipeListLoaded(recipes: recipes, query: event.query));
    }catch(e){
      emit(
        RecipeListError(
            recipes: state.recipes,
            query: event.query,
            error: e.toString()
        )
      );
    }
  }
}
