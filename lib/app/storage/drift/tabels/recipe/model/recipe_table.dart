import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class RecipeTable extends Table{
  TextColumn get id => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get cookingTime => integer()();
  IntColumn get kilocalories => integer()();
  IntColumn get servings => integer()();
  TextColumn get difficulty => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}