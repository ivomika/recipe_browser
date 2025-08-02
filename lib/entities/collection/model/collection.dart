import 'package:recipe_browser/entities/entities.dart';

class Collection extends BaseModel{
  final String title;
  final List<Recipe> recipes;
  int get length => recipes.length;

  const Collection({
    required super.id,
    required super.createdAt,
    required this.title,
    required this.recipes,
  });

  Collection.create({
    required this.title,
    required this.recipes
  }) : super.create();

  @override
  String toString() {
    return 'Set{id: $id, createdAt: $createdAt, title: $title, recipes: $recipes}';
  }
}