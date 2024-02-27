import 'package:recipes/features/domain/entities/recipe_entity.dart';

abstract class IFetchRecipeRepository{
  Future<List<RecipeEntity>> fetchRecipes();
}