import 'package:flutter/material.dart';
import 'package:recipe_browser/app/theme/theme.dart';

extension OffsetContextExtension on BuildContext{
  OffsetThemeExtension get offset => Theme.of(this).extension<OffsetThemeExtension>()!;
  ThemeData get theme => Theme.of(this);
}