import 'package:flutter/cupertino.dart';
import 'package:recipe_browser/features/recipe_list/bloc/recipe_list_bloc.dart';

typedef RecipeItemBuilder = Widget Function(BuildContext context, int index, RecipeLoaded state);
typedef RecipeSkeletonBuilder = Widget Function(BuildContext context, int index);