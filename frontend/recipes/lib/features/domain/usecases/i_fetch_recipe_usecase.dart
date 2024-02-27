import 'package:recipes/features/domain/entities/recipe_entity.dart';

abstract class IFetchRecipeUsecase{
  Future<List<RecipeEntity>> call();
}