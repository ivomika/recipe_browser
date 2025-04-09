part of 'recipe_bloc.dart';

@immutable
sealed class RecipeState extends Equatable{

  @override
  List<Object?> get props => [];
}

final class RecipeInitial extends RecipeState {
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeLoading extends RecipeState {
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;

  RecipeLoaded({required this.recipes});

  @override
  List<Object?> get props => super.props..addAll([recipes]);
}

final class RecipeError extends RecipeState {
  final String error;

  RecipeError({required this.error});

  @override
  List<Object?> get props => super.props..addAll([error]);
}

