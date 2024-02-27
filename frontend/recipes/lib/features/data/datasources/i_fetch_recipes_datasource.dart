import 'package:recipes/features/data/dto/recipe_dto.dart';

abstract class IfetchRecipeDatasource{
  Future<List<RecipeDto>> fetchRecipe();
}