import 'package:recipes/features/domain/entities/recipes_entity.dart';
import 'package:recipes/features/domain/usecases/i_recipes_usecase.dart';

import '../repositories/i_recipes_repository.dart';

class RecipesUsecase implements IRecipesUsecase {
  RecipesUsecase(this.repository);
  final IRecipesRepository repository;

  @override
  Future<List<RecipeEntity>> call() async {
    return await repository.fetchRecipes();
  }

  @override
  Future<RecipeEntity> createRecipe(String title, String text) async {
    return await repository.createRecipe(title, text);
  }
}
