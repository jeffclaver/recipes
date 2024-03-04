import 'package:recipes/features/domain/entities/recipes_entity.dart';

abstract class IRecipesUsecase{
  Future<List<RecipeEntity>> call();
  Future<RecipeEntity> createRecipe(String title, String text);
}