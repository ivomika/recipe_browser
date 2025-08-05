import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class CountTypeTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get name => text()();
}