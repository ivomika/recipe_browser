import 'package:recipe_browser/base/model/base_model.dart';

class Set extends BaseModel{
  final String title;
  final List<String> recipesIds;
  int get length => recipesIds.length;

  const Set({
    required super.id,
    required super.createdAt,
    required this.title,
    required this.recipesIds,
  });

  Set.create({
    required this.title,
    required this.recipesIds
  }) : super(
      id: 'id',
      createdAt: DateTime.now()
  );

  @override
  String toString() {
    return 'Set{id: $id, createdAt: $createdAt, title: $title, recipesIds: $recipesIds}';
  }
}