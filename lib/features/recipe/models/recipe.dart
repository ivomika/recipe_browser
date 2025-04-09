import 'package:recipe_browser/base/model/base_model.dart';

class Recipe extends BaseModel{
  final String title;

  const Recipe({
    required super.id,
    required super.createdAt,
    required this.title,
  });
}