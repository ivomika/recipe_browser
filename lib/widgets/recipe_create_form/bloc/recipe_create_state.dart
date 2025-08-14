part of 'recipe_create_cubit.dart';

@immutable
sealed class RecipeCreateState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RecipeCreateInitial extends RecipeCreateState {}
final class RecipeCreateSuccess extends RecipeCreateState {}
final class RecipeCreateError extends RecipeCreateState {
  final String error;

  RecipeCreateError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
