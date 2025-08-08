part of 'recipe_list_bloc.dart';

@immutable
sealed class RecipeListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoadingRecipeList extends RecipeListEvent{
  final String query;

  LoadingRecipeList({this.query = ''});

  @override
  List<Object?> get props => super.props..addAll([]);
}

