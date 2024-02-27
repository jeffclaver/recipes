import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/features/domain/entities/recipe_entity.dart';
import 'package:recipes/features/domain/usecases/fetch_recipe_usecase.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final FetchRecipeUsecase usecase;
  RecipesBloc(this.usecase) : super(RecipesInitial()) {
    on<RecipesEvent>((event, emit) async{
      try{
        switch (event.runtimeType) {
          case FetchRecipeEvent:
              emit(RecipesLoading());
              final response = await usecase.call();
              emit(RecipesLoaded(recipes: response));
            break;
          default:
        }
      }
      catch(e,s){
         debugPrint(e.toString() + s.toString());
        throw Exception(e.toString());
      }
    });
  }
}
