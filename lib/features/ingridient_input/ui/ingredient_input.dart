import 'package:flutter/material.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';

class IngredientInput extends StatefulWidget {
  final void Function(Ingredient value)? onSaved;
  final String? Function(Ingredient value)? validator;

  const IngredientInput({
    super.key,
    required this.onSaved,
    this.validator
  });

  @override
  State<IngredientInput> createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  late final TextEditingController _nameController;
  late final TextEditingController _countController;
  late String _countType;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _countController = TextEditingController(text: '0');
    _countType = '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _countController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FormField<Ingredient>(
        initialValue: Ingredient(
            name: '',
            count: 0,
            type: CountType.create(
                name: ''
            )
        ) ,
        onSaved: (_) => widget.onSaved?.call(
          Ingredient(
            name: _nameController.text,
            count: double.parse(_countController.text),
            type: CountType.create(name: _countType)
          )
        ),
        validator: (_) => widget.validator?.call(
            Ingredient(
                name: _nameController.text,
                count: double.parse(_countController.text),
                type: CountType.create(name: _countType)
            )
        ),
        builder: (state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.offset.small,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Ингредиент',
                    errorText: state.errorText
                ),
                onChanged: (text) => state.didChange(
                  state.value!.copyWith(
                    name: text
                  )
                ),
              ),
              TextField(
                controller: _countController,
                decoration: InputDecoration(
                    labelText: 'Количество',
                    errorText: state.errorText
                ),
                onChanged: (text) => state.didChange(
                    state.value!.copyWith(
                        count: double.parse(text)
                    )
                ),
              ),
              DropdownButtonFormField<String>(
                forceErrorText: state.errorText,
                decoration: InputDecoration(
                  labelText: 'Тип количество'
                ),
                items: [
                  DropdownMenuItem(
                      value: '1',
                      child: Text('data')
                  )
                ],
                onChanged: (value) => _countType = value ?? '',
                borderRadius: BorderRadius.circular(context.offset.large),
              ),
            ],
          );
        }
    );
  }
}
