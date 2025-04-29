import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';
import 'package:recipe_browser/features/theme/theme.dart';

class CreateRecipeDetail extends StatelessWidget {
  const CreateRecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: BackButton(
            onPressed: () => context.pop(),
          ),
          title: Text('Новый рецепт'),
        ),
        SliverToBoxAdapter(
          child: _Form()
        ),
      ],
    );
  }
}


class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late final GlobalKey<FormState> _formKey;
  late Map<String, String> _data;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _data = {};
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(
              context.offset.normal
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // title
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Название',
                    hintText: 'Крабовый салат'
                ),
                validator: _titleValidator,
                onSaved: _titleSave,
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              // description
              TextFormField(
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: 'Описание',
                    hintText: 'Дополнительная информация для Вас!'
                ),
                onSaved: _descriptionSave,
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              // cooking time
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Время готовки',
                    hintText: '60',
                    suffixText: 'мин.'
                ),
                keyboardType: TextInputType.number,
                validator: _cookingTimeValidator,
                onSaved: _cookingTimeSave,
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              // kilocalories
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Килокалории',
                    hintText: '565',
                    suffixText: 'ккал'
                ),
                keyboardType: TextInputType.number,
                validator: _kilocaloriesValidator,
                onSaved: _kilocaloriesSave,
              ),
              SizedBox(
                height: context.offset.normal,
              ),
              FilledButton(
                  onPressed: _formSubmit,
                  child: Text('Добавить')
              )
            ],
          ),
        )
    );
  }

  void _formSubmit() {
    if(_formKey.currentState!.validate() == false) return;

    _formKey.currentState!.save();
    context.read<RecipeBloc>().add(CreateRecipe(
        Recipe(
            id: '',
            createdAt: DateTime.now(),
            title: _data['title']!,
            description: _data['description']!,
            cookingTime: int.parse(_data['cookingTime']!),
            kilocalories: int.parse(_data['kilocalories']!),
            ingredients: []
        )
    ));

    context.go('/home');
  }

  String? _titleValidator(String? value) {
    if(value == null || value.isEmpty) return 'Название должно быть заполнено';

    return null;
  }

  void _titleSave(String? newValue) {
    _data['title'] = newValue!;
  }

  void _descriptionSave(String? newValue) {
    _data['description'] = newValue ?? '';
  }

  String? _cookingTimeValidator(String? value) {
    if(value == null || value.isEmpty) return 'Время готовки должно быть заполнено';

    return null;
  }

  void _cookingTimeSave(String? newValue) {
    _data['cookingTime'] = newValue!;
  }

  String? _kilocaloriesValidator(String? value) {
    if(value == null || value.isEmpty) return 'Килокалории должны быть заполнено';

    return null;
  }

  void _kilocaloriesSave(String? newValue) {
    _data['kilocalories'] = newValue!;
  }
}
