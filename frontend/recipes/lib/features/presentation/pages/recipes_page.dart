import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/config/inject.dart';
import 'package:recipes/features/presentation/bloc/recipes_bloc.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final bloc = di<RecipesBloc>();
  final controllerTitle = TextEditingController();
  final controllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchRecipeEvent());
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RecipesBloc, RecipesState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RecipesLoaded) {
            final list = state.recipes;
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    ...list.map((e) => Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.titulo,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(e.textoReceita),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text("Adicionar receita"),
                  TextField(
                    controller: controllerTitle,
                    decoration: const InputDecoration(
                      hintText: 'Titulo',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controllerText,
                    decoration: const InputDecoration(
                      hintText: 'Ingredientes',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(AddRecipeEvent(
                          title: controllerTitle.text,
                          text: controllerText.text));
                      Navigator.pop(context);
                      bloc.add(FetchRecipeEvent());
                      controllerTitle.clear();
                      controllerText.clear();
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
