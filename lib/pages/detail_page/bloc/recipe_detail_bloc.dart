import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {

  final IRecipeRepository _repository;

  RecipeDetailBloc(IRecipeRepository repository) : _repository = repository, super(RecipeDetailInitial()) {
    on<LoadingRecipeDetail>(_loadingRecipeDetail);
  }

  FutureOr<void> _loadingRecipeDetail(LoadingRecipeDetail event, Emitter<RecipeDetailState> emit) async {
    emit(RecipeDetailLoading());

    try{
      await Future.delayed(Duration(seconds: 2));
      final recipe = await _repository.byId(event.id);
      emit(RecipeDetailLoaded(recipe));
    }catch(e){
      emit(RecipeDetailError(error: e.toString()));
    }
  }
}
