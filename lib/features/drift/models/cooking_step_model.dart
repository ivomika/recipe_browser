import 'package:recipe_browser/shared/models/models.dart';

class CookingStepModel{
  final String description;

  CookingStepModel({
    required this.description,
  });

  // Конвертация в JSON
  Map<String, dynamic> toJson() => {
    'description': description,
  };

  // Создание объекта из JSON
  factory CookingStepModel.fromJson(Map<String, dynamic> json) => CookingStepModel(
    description: json['description'],
  );
}

extension CookingStepConverterToDataModel on CookingStep{
  CookingStepModel toDataModel(){
    return CookingStepModel(
        description: description,
    );
  }
}

extension CookingStepConverterToLocalModel on CookingStepModel{
  CookingStep toLocalModel(){
    return CookingStep(
        description: description,
    );
  }
}