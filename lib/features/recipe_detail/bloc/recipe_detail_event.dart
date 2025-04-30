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

