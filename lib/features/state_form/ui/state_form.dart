import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/state_form/bloc/state_form_cubit.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';

class StateForm extends StatelessWidget {
  final List<Widget> children;

  const StateForm({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<StateFormCubit>().formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: children
        )
    );
  }
}
