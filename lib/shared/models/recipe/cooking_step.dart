import 'package:equatable/equatable.dart';

class CookingStep extends Equatable{
  final String description;

  const CookingStep({
    required this.description
  });

  @override
  List<Object?> get props => [description];
}