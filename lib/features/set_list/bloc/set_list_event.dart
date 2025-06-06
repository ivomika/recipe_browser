part of 'set_list_bloc.dart';

@immutable
sealed class SetListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoadingSetList extends SetListEvent{
  @override
  List<Object?> get props => super.props..addAll([]);
}
