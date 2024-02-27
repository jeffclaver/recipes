import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/config/inject.dart';
import 'package:recipes/features/presentation/bloc/recipes_bloc.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final bloc = di<RecipesBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchRecipeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: bloc,
        listener: (previous, current) {},
        buildWhen: (previous, current) => current is RecipesLoaded,
        builder: (context, state) {
          switch (state.runtimeType) {
            case RecipesLoaded:
              final list = (state as RecipesLoaded).recipes;
              return SingleChildScrollView(
                child: SafeArea(
                    child: Column(
                  children: [
                    ...list.map((e) => Card(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(e.titulo, style: const TextStyle(fontWeight: FontWeight.bold),),
                        Text(e.textoReceita),
                      ],
                    ),))
                  ],
                )),
              );
              
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
