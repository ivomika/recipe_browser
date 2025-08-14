import 'package:recipe_browser/entities/base/model/base_sub_model.dart';

class CookingStep extends BaseSubModel{
  final String description;

  const CookingStep({
    required this.description
  });

  @override
  List<Object?> get props => [description];

  @override
  String toString() {
    return 'CookingStep{description: $description}';
  }
}