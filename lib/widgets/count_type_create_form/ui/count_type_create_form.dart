import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/state_form/bloc/state_form_cubit.dart';
import 'package:recipe_browser/features/state_form/ui/state_form.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';

class CountTypeCreateForm extends StatelessWidget {
  final void Function(Map<String, dynamic> data) onSaved;

  const CountTypeCreateForm({
    super.key,
    required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => StateFormCubit(
            onSaveForm: onSaved
        ),
        child: Builder(
          builder: (context) {
            return StateForm(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Название'
                    ),
                    validator: (text) {
                      if(text == null || text.isEmpty){
                        return 'Пусто';
                      }

                      return null;
                    },
                    onSaved: (text) => context.read<StateFormCubit>().addField(
                        'name',
                        text
                    ),
                  ),
                  SizedBox(height: context.offset.normal,),
                  FilledButton(
                      onPressed: () => context.read<StateFormCubit>().save(),
                      child: Text('Добавить')
                  )
                ]
            );
          }
        )
    );
  }
}
