part of 'recipe_bloc.dart';

@immutable
sealed class RecipeEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

class LoadingRecipes extends RecipeEvent{
  @override
  List<Object?> get props => super.props..addAll([]);
}

class CreateRecipe extends RecipeEvent{
  final Recipe recipe;

  CreateRecipe(this.recipe);

  @override
  List<Object?> get props => super.props..addAll([]);
}
