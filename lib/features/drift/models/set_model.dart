import 'package:drift/drift.dart';
import 'package:recipe_browser/features/drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:recipe_browser/shared/models/models.dart';

class SetModel extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text()();
  TextColumn get recipeIds => text().map(const RecipeListConverter())();
}


extension SetConverterToDataModel on Set{
  SetModelCompanion toDataModel(){
    return SetModelCompanion(
        title: Value(title),
        recipeIds: Value(recipesIds),
    );
  }
}

extension SetConverterToLocalModel on SetModelData{
  Set toLocalModel(){
    return Set(
        id: uuid,
        createdAt: createdAt,
        title: title,
        recipesIds: recipeIds
    );
  }
}