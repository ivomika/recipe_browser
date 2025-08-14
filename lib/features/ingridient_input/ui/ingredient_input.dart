import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/shared/utils/extensions/theme_context_extension.dart';

class IngredientInput extends StatefulWidget {
  final void Function(Ingredient? value)? onSaved;
  final String? Function(Ingredient? value)? validator;
  final void Function(Ingredient? value)? onChanged;

  const IngredientInput({
    super.key,
    this.onSaved,
    this.validator,
    this.onChanged
  });

  @override
  State<IngredientInput> createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  late final ICountTypeRepository _countRepository;
  late Future<List<CountType>> _futureData;

  @override
  void initState() {
    super.initState();
    _countRepository = context.read<ICountTypeRepository>();
    _futureData = Future(() async => await _countRepository.all());
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
        ),
        onSaved: widget.onSaved,
        validator: widget.validator,
        builder: (state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.offset.small,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Ингредиент',
                    errorText: state.errorText
                ),
                onChanged: (text) {
                  state.didChange(
                      state.value!.copyWith(
                          name: text
                      )
                  );
                  widget.onChanged?.call(state.value);
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Количество',
                    errorText: state.errorText
                ),
                onChanged: (text) {
                  state.didChange(
                      state.value!.copyWith(
                          count: double.parse(text)
                      )
                  );
                  widget.onChanged?.call(state.value);
                },
              ),
              FutureBuilder(
                  future: _futureData,
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'Загрузка'
                        ),
                      );
                    }


                    if(snapshot.data == null || snapshot.data!.isEmpty){
                      return TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            labelText: 'Нет данных'
                        ),
                      );
                    }

                    return DropdownButtonFormField<CountType>(
                      forceErrorText: state.errorText,
                      decoration: InputDecoration(
                          labelText: 'Тип количество'
                      ),
                      items: snapshot.data!.map(
                          (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name)
                          )
                      ).toList(growable: false),
                      onChanged: (value) {
                        state.didChange(
                            state.value!.copyWith(
                                type: value
                            )
                        );
                        widget.onChanged?.call(state.value);
                      },
                      borderRadius: BorderRadius.circular(context.offset.large),
                    );
                  }
              )
            ],
          );
        }
    );
  }
}
