import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:recipe_browser/features/recipe/models/recipe.dart';
import 'package:uuid/uuid.dart';

class RecipeModel extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text()();
}

extension RecipeToModel on Recipe{
  RecipeModelData toDataModel(){
    return RecipeModelData(
        id: 0,
        uuid: id,
        createdAt: createdAt,
        title: title,
    );
  }
}

extension ModelToRecipe on RecipeModelData{
  Recipe toLocalModel(){
    return Recipe(
        id: uuid,
        createdAt: createdAt,
        title: title
    );
  }
}