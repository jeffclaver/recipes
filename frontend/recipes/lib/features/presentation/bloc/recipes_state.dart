part of 'recipes_bloc.dart';

@immutable
sealed class RecipesState {}

class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<RecipeEntity> recipes;

  RecipesLoaded({required this.recipes});
}

class RecipesError extends RecipesState {
  final String message;

  RecipesError({required this.message});
}
