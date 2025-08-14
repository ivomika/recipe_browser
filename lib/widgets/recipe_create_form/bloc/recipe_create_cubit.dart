import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_browser/entities/entities.dart';

part 'recipe_create_state.dart';

class RecipeCreateCubit extends Cubit<RecipeCreateState> {
  final IRecipeRepository _repository;

  RecipeCreateCubit(this._repository) : super(RecipeCreateInitial());

  Future<void> create(Recipe model) async {
    try{
      await _repository.create(model);
      emit(RecipeCreateSuccess());
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      emit(RecipeCreateError(e.toString()));
    }
  }
}
