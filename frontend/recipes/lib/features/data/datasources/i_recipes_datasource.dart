import 'package:recipes/features/data/dto/recipes_dto.dart';

abstract class IRecipesDatasource{
  Future<List<RecipesDto>> fetchRecipe();
  Future<RecipesDto> createRecipe(String title, String text);
}