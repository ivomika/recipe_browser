part of 'recipe_list_bloc.dart';

@immutable
sealed class RecipeListEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

class LoadingRecipes extends RecipeListEvent{
  @override
  List<Object?> get props => super.props..addAll([]);
}

final class DeleteRecipe extends RecipeListEvent{
  final Recipe recipe;

  DeleteRecipe(this.recipe);

  @override
  List<Object?> get props => super.props..addAll([recipe]);
}