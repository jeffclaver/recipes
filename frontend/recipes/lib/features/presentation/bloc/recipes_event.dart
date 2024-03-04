part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object?> get props => [];
}

class FetchRecipeEvent extends RecipesEvent {}

class AddRecipeEvent extends RecipesEvent {
  final String title;
  final String text;

  const AddRecipeEvent({
    required this.title,
    required this.text,
  });
  @override
  List<Object?> get props => [title, text];
}
