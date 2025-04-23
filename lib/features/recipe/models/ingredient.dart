import 'package:equatable/equatable.dart';
import 'package:recipe_browser/features/recipe/models/count_type.dart';

class Ingredient extends Equatable{
  final String name;
  final double count;
  final CountType type;

  const Ingredient({
    required this.name,
    required this.count,
    required this.type
  });

  @override
  List<Object?> get props => [name, count, type];

  @override
  String toString() {
    return 'Ingredient{name: $name, count: $count, type: $type}';
  }
}