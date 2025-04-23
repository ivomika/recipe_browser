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

  RecipeDetailLoaded(this.recipe);

  @override
  List<Object?> get props => super.props..addAll([recipe]);
}

final class RecipeDetailError extends RecipeDetailState{
  final String error;

  RecipeDetailError({required this.error});

  @override
  List<Object?> get props => super.props..addAll([error]);
}
