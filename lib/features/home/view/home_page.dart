import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_browser/features/recipe/recipe.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: context.read<IRecipeRepository>().all(),
        builder: (context, snapshot){
          if(snapshot.hasData == false){
            return Center(child: CircularProgressIndicator());
          }

          return Text(snapshot.data!.length.toString());
        }
    );
  }
}
