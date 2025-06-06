import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {

  final IRecipeRepository _recipeRepository;
  final ISetRepository _setRepository;

  RecipeDetailBloc(this._recipeRepository, this._setRepository) : super(RecipeDetailInitial()) {
    on<LoadingRecipeDetail>(_loadingRecipeDetail);
    on<ConfirmRecipeDetailStep>(_confirmRecipeDetailStep);
    on<DeleteRecipeDetail>(_deleteRecipe);
  }

  FutureOr<void> _loadingRecipeDetail(LoadingRecipeDetail event, Emitter<RecipeDetailState> emit) async {
    emit(RecipeDetailLoading());

    try{
      final recipe = await _recipeRepository.byId(event.id);
      final sets = await _setRepository.byRecipeId(event.id);
      emit(RecipeDetailLoaded(recipe, sets, 0));
    }catch(e){
      emit(RecipeDetailError(error: e.toString()));
    }
  }

  FutureOr<void> _confirmRecipeDetailStep(ConfirmRecipeDetailStep event, Emitter<RecipeDetailState> emit) async {
    final recipe = await _recipeRepository.byId(event.id);
    final sets = await _setRepository.byRecipeId(event.id);

    emit(RecipeDetailLoaded(recipe, sets, event.index));
  }

  FutureOr<void> _deleteRecipe(DeleteRecipeDetail event, Emitter<RecipeDetailState> emit) async {
    try{
      final result = await _recipeRepository.delete(event.recipe);
      if(result == false) throw InvalidDataException('Нет подходящего объекта для удаления');
    }catch(e){
      emit(RecipeDetailError(error: e.toString()));
    }
  }
}
