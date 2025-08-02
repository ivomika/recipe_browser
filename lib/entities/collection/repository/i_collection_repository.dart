import 'dart:async';
import 'package:recipe_browser/entities/collection/collection.dart';

abstract interface class ICollectionRepository{
  FutureOr<List<Collection>> all();
  FutureOr<Collection> byId(String id);
  FutureOr<Collection> create(Collection model);
  FutureOr<Collection> update(Collection model);
  FutureOr<bool> delete(Collection model);
  FutureOr<List<Collection>> byRecipeId(String id);
}