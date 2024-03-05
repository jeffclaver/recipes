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
  late final RecipesBloc bloc;
  late TextEditingController controllerTitle;
  late TextEditingController controllerText;

  @override
  void initState() {
    super.initState();
    bloc = di<RecipesBloc>();
    controllerTitle = TextEditingController();
    controllerText = TextEditingController();
    bloc.add(FetchRecipeEvent());
  }

  @override
  void dispose() {
    bloc.close();
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
                    ...list.map(
                      (recipe) => GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(recipe.titulo),
                                content: Text(recipe.textoReceita),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Fechar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  "http://via.placeholder.com/350x280",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 15),
                                child: Text(
                                  recipe.titulo,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Row(
                                  children: [
                                    CircleAvatar(),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Troxs",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.favorite, size: 16),
                                            SizedBox(width: 8),
                                            Text("130"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(Icons.favorite_outline),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
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
