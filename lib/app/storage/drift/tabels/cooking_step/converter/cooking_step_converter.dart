import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/entities/entities.dart';

class CookingStepConverter{
  static CookingStep toLocalModel(CookingStepTableData data){
    return CookingStep(
        description: data.description
    );
  }
}