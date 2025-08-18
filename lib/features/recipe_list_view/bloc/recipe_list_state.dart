part of 'recipe_list_bloc.dart';

@immutable
sealed class RecipeListState extends Equatable {
  final String query;
  final List<Recipe> recipes;

  const RecipeListState({this.query = '', this.recipes = const []});

  @override
  List<Object?> get props => [recipes, query];
}

final class RecipeListInitial extends RecipeListState {
  const RecipeListInitial({
    super.recipes = const [],
    super.query
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
    required super.recipes,
    super.query
  });

  @override
  List<Object?> get props => super.props..addAll([]);
}

final class RecipeListError extends RecipeListState {
  final String error;

  const RecipeListError({
    required super.recipes,
    required this.error,
    super.query
  });

  @override
  List<Object?> get props => super.props..addAll([error]);
}
