part of 'create_recipe_cubit.dart';

@immutable
sealed class CreateRecipeState extends Equatable {
  final CreateRecipeModel data;

  const CreateRecipeState(this.data);
  @override
  List<Object?> get props => [data];
}

final class CreateRecipeInitial extends CreateRecipeState {
  const CreateRecipeInitial(super.data);

  @override
  List<Object?> get props => super.props..addAll([]);
}

final class CreateRecipeError extends CreateRecipeState {
  final String error;

  const CreateRecipeError(this.error, super.data);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
