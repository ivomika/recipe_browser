import 'package:flutter/material.dart';

class OffsetThemeExtension extends ThemeExtension<OffsetThemeExtension>{
  final double verySmall;
  final double small;
  final double normal;
  final double large;
  final double veryLarge;


  OffsetThemeExtension({
    required this.verySmall,
    required this.small,
    required this.normal,
    required this.large,
    required this.veryLarge
  });

  @override
  ThemeExtension<OffsetThemeExtension> copyWith({double? verySmall, double? small, double? normal, double? large, double? veryLarge,}) {
    return OffsetThemeExtension(
        verySmall: verySmall ?? this.verySmall,
        small: small ?? this.small,
        normal: normal ?? this.normal,
        large: large ?? this.large,
        veryLarge: veryLarge ?? this.veryLarge,
    );
  }

  @override
  ThemeExtension<OffsetThemeExtension> lerp(covariant ThemeExtension<OffsetThemeExtension>? other, double t) {
    return this;
  }
}