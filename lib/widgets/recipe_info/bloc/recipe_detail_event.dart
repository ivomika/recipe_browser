part of 'recipe_detail_bloc.dart';

@immutable
sealed class RecipeDetailEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class LoadingRecipeDetail extends RecipeDetailEvent{
  final String id;

  LoadingRecipeDetail(this.id);

  @override
  List<Object?> get props => super.props..addAll([id]);
}

final class ConfirmRecipeDetailStep extends RecipeDetailEvent{
  final String id;
  final int index;

  ConfirmRecipeDetailStep(
      this.id,
      this.index
  );

  @override
  List<Object?> get props => super.props..addAll([id, index]);
}

final class DeleteRecipeDetail extends RecipeDetailEvent{
  final Recipe recipe;

  DeleteRecipeDetail(
      this.recipe,
  );

  @override
  List<Object?> get props => super.props..addAll([recipe]);
}

