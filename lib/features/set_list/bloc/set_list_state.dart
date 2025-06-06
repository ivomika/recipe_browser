part of 'set_list_bloc.dart';

@immutable
sealed class SetListState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SetListInitial extends SetListState {}

final class SetListLoading extends SetListState {}

final class SetListLoaded extends SetListState {
  final List<Set> sets;

  SetListLoaded(this.sets);

  @override
  List<Object?> get props => super.props..addAll([sets]);
}

final class SetListError extends SetListState {
  final String error;

  SetListError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
