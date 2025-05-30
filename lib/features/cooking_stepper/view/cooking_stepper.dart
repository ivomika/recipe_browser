import 'package:flutter/material.dart';
import 'package:recipe_browser/shared/models/models.dart';
import 'package:recipe_browser/utils/utils.dart';

class CookingStepper extends StatelessWidget {
  final List<CookingStep> steps;
  final int currentIndex;
  final VoidCallback onStepContinue;
  final void Function(int index) onStepTapped;

  const CookingStepper({
    super.key,
    required this.steps,
    required this.currentIndex,
    required this.onStepContinue,
    required this.onStepTapped
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -55),
      child: Stepper(
          currentStep: currentIndex,
          onStepContinue: onStepContinue,
          onStepTapped: onStepTapped,
          physics: NeverScrollableScrollPhysics(),
          connectorThickness: 6,
          stepIconHeight: 32,
          stepIconWidth: 32,
          stepIconBuilder: (index, state) {
            return Icon(
                Icons.lens_rounded,
                color: context.theme.scaffoldBackgroundColor,
            );
          },
          controlsBuilder: (context, detail){
            if(detail.stepIndex == steps.length - 1) return SizedBox();

            return Transform.translate(
              offset: Offset(0, 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FilledButton(
                    onPressed: detail.onStepContinue,
                    child: Text('Дальше')
                ),
              ),
            );
          },
          steps: List.generate(
              steps.length,
              (index) => Step(
                  title: Text('Шаг #${index + 1}'),
                  content: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(steps.elementAt(index).description)
                  ),
                  stepStyle: StepStyle(

                  ),
                  isActive: index <= currentIndex,
                  state: index <= currentIndex
                      ? StepState.complete
                      : StepState.indexed
              ),
              growable: false
          )
      ),
    );
  }
}