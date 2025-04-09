import 'package:recipe_browser/base/model/base_model.dart';

class Recipe extends BaseModel{
  final String title;

  const Recipe({
    required super.id,
    required super.createdAt,
    required this.title,
  });

  @override
  String toString() {
    return 'Recipe{id: $id, createdAt: $createdAt, title: $title}';
  }
}