import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';

part 'set_detail_event.dart';
part 'set_detail_state.dart';

class SetDetailBloc extends Bloc<SetDetailEvent, SetDetailState> {
  final ISetRepository _setRepository;
  final IRecipeRepository _recipeRepository;

  SetDetailBloc(this._setRepository, this._recipeRepository) : super(SetDetailInitial()) {
    on<LoadingSetDetail>(_onLoadingSetDetail);
    on<AddRecipeSetDetail>(_onAddRecipeSetDetail);
    on<RemoveRecipeSetDetail>(_onRemoveRecipeSetDetail);
  }

  FutureOr<void> _onLoadingSetDetail(LoadingSetDetail event, Emitter<SetDetailState> emit) async {
    emit(SetDetailLoading());

    try{
      final set = await _setRepository.byId(event.id);
      final recipes = await _recipeRepository.byIds(set.recipesIds);

      emit(SetDetailLoaded(set, recipes));
    }catch(e){
      emit(SetDetailError(e.toString()));
    }
  }

  FutureOr<void> _onAddRecipeSetDetail(AddRecipeSetDetail event, Emitter<SetDetailState> emit) async {
    try{
      final sets = await _setRepository.all();

      final set = sets.first..recipesIds.add(event.id);

      await _setRepository.update(set);


    }catch(e){
      emit(SetDetailError(e.toString()));
    }
  }

  FutureOr<void> _onRemoveRecipeSetDetail(RemoveRecipeSetDetail event, Emitter<SetDetailState> emit) async {
    try{
      final sets = await _setRepository.all();

      final set = sets.first..recipesIds.remove(event.id);

      await _setRepository.update(set);
    }catch(e){
      emit(SetDetailError(e.toString()));
    }
  }
}
