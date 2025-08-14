part of 'count_type_create_cubit.dart';

@immutable
sealed class CountTypeCreateState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CountTypeCreateInitial extends CountTypeCreateState {}
final class CountTypeCreateSuccess extends CountTypeCreateState {}
final class CountTypeCreateError extends CountTypeCreateState {
  final String error;

  CountTypeCreateError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
