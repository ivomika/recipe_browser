import 'dart:async';
import 'package:recipe_browser/entities/count_type/count_type.dart';

abstract interface class ICountTypeRepository{
  FutureOr<List<CountType>> all();
  FutureOr<CountType> byId(String id);
  FutureOr<List<CountType>> byIds(List<String> ids);
  FutureOr<CountType> create(CountType model);
  FutureOr<CountType> update(CountType model);
  FutureOr<bool> delete(CountType model);
}