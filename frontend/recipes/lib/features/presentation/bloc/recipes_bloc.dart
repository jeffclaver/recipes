import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/features/domain/entities/recipes_entity.dart';
import 'package:recipes/features/domain/usecases/recipes_usecase.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipesUsecase usecase;
  RecipesBloc(this.usecase) : super(RecipesInitial()) {
    on<FetchRecipeEvent>(_fetchRecipes);
    on<AddRecipeEvent>(_addRecipe);
  }
  void _fetchRecipes(FetchRecipeEvent event, Emitter<RecipesState> emit) async {
    emit(RecipesLoading());
    try {
      final recipes = await usecase.call();
      emit(RecipesLoaded(recipes: recipes));
    } catch (e) {
      emit(RecipesError(message: "Falha em buscar as receitas $e"));
    }
  }

  void _addRecipe(AddRecipeEvent event, Emitter<RecipesState> emit) async {
    try {
      final addRecipe = await usecase.createRecipe(event.title, event.text);
      final currentRecipes = (state as RecipesLoaded).recipes;
      final updateRecipes = [...currentRecipes, addRecipe];
      emit(RecipesLoaded(recipes: updateRecipes));
    } catch (e) {
      emit(RecipesError(message: "Falha em adicionar uma receita: $e"));
    }
  }
}
