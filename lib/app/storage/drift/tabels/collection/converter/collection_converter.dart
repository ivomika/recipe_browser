import 'package:recipe_browser/app/storage/drift/database/drift_app_database.dart';
import 'package:recipe_browser/entities/entities.dart';

class CollectionConverter{
  static Collection toLocalModel(CollectionTableData data, List<Recipe> recipes){
    return Collection(
        id: data.uuid,
        createdAt: data.createdAt,
        title: data.title,
        recipes: recipes
    );
  }
}