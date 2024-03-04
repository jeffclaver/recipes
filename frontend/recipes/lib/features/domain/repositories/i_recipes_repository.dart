import 'package:recipes/features/domain/entities/recipes_entity.dart';

abstract class IRecipesRepository{
  Future<List<RecipeEntity>> fetchRecipes();
  Future<RecipeEntity> createRecipe(String title, String text);
}