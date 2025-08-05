import 'package:recipe_browser/entities/base/model/base_model.dart';

class CountType extends BaseModel{
  final String name;

  const CountType({
    required super.id,
    required super.createdAt,
    required this.name,
  });

  CountType.create({
    required this.name
  }) : super.create();

  @override
  List<Object?> get props => super.props..addAll([name]);

  @override
  String toString() {
    return 'CountType{id: $id, createdAt: $createdAt, name: $name}';
  }
}