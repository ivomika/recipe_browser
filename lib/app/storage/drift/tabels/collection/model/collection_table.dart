import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class CollectionTable extends Table{
  TextColumn get id => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get title => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}