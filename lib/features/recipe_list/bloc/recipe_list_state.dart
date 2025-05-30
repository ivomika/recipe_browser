part of 'recipe_list_bloc.dart';

@immutable
sealed class RecipeListState extends Equatable{

  @override
  List<Object?> get props => [];
}

final class RecipeInitial extends RecipeListState {
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeLoading extends RecipeListState {
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeLoaded extends RecipeListState {
  final List<Recipe> recipes;

  RecipeLoaded({required this.recipes});

  @override
  List<Object?> get props => super.props..addAll([recipes]);
}

final class RecipeError extends RecipeListState {
  final String error;

  RecipeError({required this.error});

  @override
  List<Object?> get props => super.props..addAll([error]);
}

