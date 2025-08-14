import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_browser/entities/entities.dart';
import 'package:recipe_browser/widgets/count_type_create_form/bloc/count_type_create_cubit.dart';
import 'package:recipe_browser/widgets/count_type_create_form/ui/count_type_create_form.dart';

class CreateCountType extends StatelessWidget {
  const CreateCountType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountTypeCreateCubit(
        context.read<ICountTypeRepository>()
      ),
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<CountTypeCreateCubit, CountTypeCreateState>(
              listener: (context, state) {
                print(state.runtimeType);
                if(state is CountTypeCreateError){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(state.error)
                      )
                  );
                  return;
                }

                GoRouter.of(context).go('/');
              },
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: CountTypeCreateForm(
                          onSaved: (data) => context.read<CountTypeCreateCubit>().create(
                            CountType.create(
                                name: data['name']
                            )
                          )
                      ),
                    )
                  ],
                );
              },
            )
        ),
      ),
    );
  }
}
