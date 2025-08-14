import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:recipe_browser/entities/entities.dart';

part 'count_type_create_state.dart';

class CountTypeCreateCubit extends Cubit<CountTypeCreateState> {
  final ICountTypeRepository _repository;

  CountTypeCreateCubit(this._repository) : super(CountTypeCreateInitial());

  Future<void> create(CountType model) async {
    try{
      await _repository.create(model);
      emit(CountTypeCreateSuccess());
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      emit(CountTypeCreateError(e.toString()));
    }
  }
}
