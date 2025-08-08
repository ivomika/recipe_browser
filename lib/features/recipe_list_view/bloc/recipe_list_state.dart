part of 'recipe_list_bloc.dart';

@immutable
sealed class RecipeListState extends Equatable {
  final List<Recipe> recipes;

  const RecipeListState({this.recipes = const []});

  @override
  List<Object?> get props => [recipes];
}

final class RecipeListInitial extends RecipeListState {
  const RecipeListInitial({
    super.recipes = const []
  });

  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeListLoading extends RecipeListState {
  const RecipeListLoading();

  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeListLoaded extends RecipeListState {
  const RecipeListLoaded({
    required super.recipes
  });

  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeListError extends RecipeListState {
  final String error;

  const RecipeListError({
    required super.recipes,
    required this.error
  });

  @override
  List<Object?> get props => super.props..addAll([error]);
}
