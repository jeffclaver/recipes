import 'package:recipes/features/data/datasources/i_fetch_recipes_datasource.dart';
import 'package:recipes/features/domain/entities/recipe_entity.dart';
import 'package:recipes/features/domain/repositories/i_fetch_recipe_repository.dart';

class FetchRecipesRepository implements IFetchRecipeRepository {
  FetchRecipesRepository(this.datasource);
  final IfetchRecipeDatasource datasource;

  @override
  Future<List<RecipeEntity>> fetchRecipes() async {
    final response = await datasource.fetchRecipe();
    return response
        .map(
          (recipeDto) => RecipeEntity(
            id: recipeDto.id,
            titulo: recipeDto.titulo,
            textoReceita: recipeDto.textoReceita,
          ),
        )
        .toList();
  }
}
