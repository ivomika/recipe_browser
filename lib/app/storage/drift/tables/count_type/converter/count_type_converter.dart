import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/entities/entities.dart';

class CountTypeConverter{
  static CountType toLocalModel(CountTypeTableData data){
    return CountType(
        id: data.id,
        createdAt: data.createdAt,
        name: data.name
    );
  }
}