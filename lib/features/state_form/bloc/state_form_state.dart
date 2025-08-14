part of 'state_form_cubit.dart';

@immutable
sealed class StateFormState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class StateFormInitial extends StateFormState {}

final class StateFormSuccess extends StateFormState{}
final class StateFormError extends StateFormState{
  final String error;

  StateFormError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
