import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_browser/shared/repositories/repositories.dart';
import 'package:recipe_browser/shared/models/models.dart';

part 'set_list_event.dart';
part 'set_list_state.dart';

class SetListBloc extends Bloc<SetListEvent, SetListState> {
  final ISetRepository _repository;

  SetListBloc(ISetRepository repository) : _repository = repository, super(SetListInitial()) {
    on<LoadingSetList>(_loadSetList);
  }

  FutureOr<void> _loadSetList(LoadingSetList event, Emitter<SetListState> emit) async {
    emit(SetListLoading());
    try{
      final sets = await _repository.all();
      if(sets.isEmpty){
        final newSet = await _repository.create(Set.create(
            title: 'Избранное',
            recipesIds: []
        ));

        emit(SetListLoaded([newSet]));
        return;
      }

      emit(SetListLoaded(sets));
    }catch (e){
      emit(SetListError(e.toString()));
    }
  }
}
