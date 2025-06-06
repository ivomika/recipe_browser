part of 'set_detail_bloc.dart';

@immutable
sealed class SetDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SetDetailInitial extends SetDetailState {
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class SetDetailLoading extends SetDetailState{
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class SetDetailLoaded extends SetDetailState{
  final Set set;
  final List<Recipe> recipes;

  SetDetailLoaded(this.set, this.recipes);

  @override
  List<Object?> get props => super.props..addAll([set, recipes]);
}

final class SetDetailError extends SetDetailState{
  final String error;

  SetDetailError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
