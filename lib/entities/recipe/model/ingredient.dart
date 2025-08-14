import 'package:recipe_browser/entities/entities.dart';

class Ingredient extends BaseSubModel{
  final String name;
  final double count;
  final CountType type;

  const Ingredient({
    required this.name,
    required this.count,
    required this.type
  });


  Ingredient copyWith({String? name, double? count, CountType? type}) =>
      Ingredient(
          name: name ?? this.name,
          count: count ?? this.count,
          type: type ?? this.type
      );

  @override
  List<Object?> get props => [name, count, type];

  @override
  String toString() {
    return 'Ingredient{name: $name, count: $count, type: $type}';
  }
}