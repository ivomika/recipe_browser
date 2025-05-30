import 'package:flutter/material.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class AnimatedArrow extends StatefulWidget {
  final SheetController sheet;

  const AnimatedArrow({
    super.key,
    required this.sheet
  });

  @override
  State<AnimatedArrow> createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<AnimatedArrow> {
  late double _animationValue;

  @override
  void initState() {
    super.initState();
    _animationValue = 0;
    widget.sheet.addListener(_animationListener);
  }

  @override
  void dispose() {
    widget.sheet.removeListener(_animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _animationValue,
      duration: Duration(microseconds: 10),
      child: Icon(
        size: 48,
        Icons.keyboard_arrow_up,
        color: context.theme.colorScheme.onSurface.withAlpha(60),
      ),
    );
  }

  double normalize(
      double value, {
        required double sourceMin,
        required double sourceMax,
        double targetMin = 0.0,
        double targetMax = 0.5,
      }) {
    // Обработка случая, когда исходный диапазон невалиден
    if (sourceMin == sourceMax) return targetMin;
    if (value > sourceMax) return targetMax;
    if (value < sourceMin) return targetMin;

    // Вычисление нормализованного значения
    final double ratio = (value - sourceMin) / (sourceMax - sourceMin);
    return ratio * (targetMax - targetMin) + targetMin;
  }

  void _animationListener() {
    setState(() => _animationValue = normalize(
      widget.sheet.value ?? 0,
      sourceMin: widget.sheet.metrics?.minOffset ?? 0,
      sourceMax: widget.sheet.metrics?.maxOffset ?? 1,
    )
    );
  }
}
