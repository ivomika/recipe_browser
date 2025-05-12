part of 'recipe_detail_bloc.dart';

@immutable
sealed class RecipeDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RecipeDetailInitial extends RecipeDetailState {}

final class RecipeDetailLoading extends RecipeDetailState{}

final class RecipeDetailLoaded extends RecipeDetailState{
  final Recipe recipe;
  final int stepIndex;

  RecipeDetailLoaded(
      this.recipe,
      this.stepIndex
  );

  @override
  List<Object?> get props => super.props..addAll([recipe, stepIndex]);
}

final class RecipeDetailError extends RecipeDetailState{
  final String error;

  RecipeDetailError({required this.error});

  @override
  List<Object?> get props => super.props..addAll([error]);
}
