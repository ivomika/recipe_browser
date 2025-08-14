import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'state_form_state.dart';

class StateFormCubit extends Cubit<StateFormState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> data = {};
  final Function(Map<String, dynamic> data) onSaveForm;

  StateFormCubit({required this.onSaveForm}) : super(StateFormInitial());

  void addField<Value>(String key, Value value){
    data[key] = value;
  }

  void save(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      onSaveForm(data);
    }
  }
}
