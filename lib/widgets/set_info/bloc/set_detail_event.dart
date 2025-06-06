part of 'set_detail_bloc.dart';

@immutable
sealed class SetDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoadingSetDetail extends SetDetailEvent{
  final String id;

  LoadingSetDetail(this.id);

  @override
  List<Object?> get props => super.props..addAll([id]);
}

final class AddRecipeSetDetail extends SetDetailEvent{
  final String id;

  AddRecipeSetDetail(this.id);

  @override
  List<Object?> get props => super.props..addAll([id]);
}

final class RemoveRecipeSetDetail extends SetDetailEvent{
  final String id;

  RemoveRecipeSetDetail(this.id);

  @override
  List<Object?> get props => super.props..addAll([id]);
}
