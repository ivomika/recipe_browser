import 'package:recipe_browser/shared/models/models.dart';

class CreateIngredientModel{
  String? name;
  double? count;
  CountType? type;

  CreateIngredientModel({
    this.name,
    this.count,
    this.type
  });

  @override
  String toString() {
    return 'CreateIngredientModel{name: $name, count: $count, type: $type}';
  }
}