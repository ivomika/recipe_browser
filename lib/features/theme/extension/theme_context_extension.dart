import 'package:flutter/material.dart';
import 'package:recipe_browser/features/theme/extension/offset_extension.dart';

extension OffsetContextExtension on BuildContext{
  OffsetExtension get offset => Theme.of(this).extension<OffsetExtension>()!;
  ThemeData get theme => Theme.of(this);
}