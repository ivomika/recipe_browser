import 'package:flutter/material.dart';

class OffsetExtension extends ThemeExtension<OffsetExtension>{
  final double verySmall;
  final double small;
  final double normal;
  final double large;
  final double veryLarge;


  OffsetExtension({
    required this.verySmall,
    required this.small,
    required this.normal,
    required this.large,
    required this.veryLarge
  });

  @override
  ThemeExtension<OffsetExtension> copyWith({double? verySmall, double? small, double? normal, double? large, double? veryLarge,}) {
    return OffsetExtension(
        verySmall: verySmall ?? this.verySmall,
        small: small ?? this.small,
        normal: normal ?? this.normal,
        large: large ?? this.large,
        veryLarge: veryLarge ?? this.veryLarge,
    );
  }

  @override
  ThemeExtension<OffsetExtension> lerp(covariant ThemeExtension<OffsetExtension>? other, double t) {
    return this;
  }
}