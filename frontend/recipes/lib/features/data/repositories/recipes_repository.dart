import 'package:recipes/features/data/datasources/i_recipes_datasource.dart';
import 'package:recipes/features/data/dto/recipes_dto.dart';
import 'package:recipes/features/domain/entities/recipes_entity.dart';
import 'package:recipes/features/domain/repositories/i_recipes_repository.dart';

class RecipesRepository implements IRecipesRepository {
  RecipesRepository(this.datasource);
  final IRecipesDatasource datasource;

  @override
  Future<List<RecipeEntity>> fetchRecipes() async {
    try {
      final List<RecipesDto> recipeDto = await datasource.fetchRecipe();
      final List<RecipeEntity> recipes = recipeDto
          .map((dto) =>
              RecipeEntity(id: dto.id, titulo: dto.titulo, textoReceita: dto.textoReceita))
          .toList();
      return recipes;
    } catch (e) {
      throw Exception("Erro em buscar receitas: $e");
    }
  }

  @override
  Future<RecipeEntity> createRecipe(String title, String text) async {
    try {
      final addRecipeDto = await datasource.createRecipe(title, text);
      final addRecipeEntity = RecipeEntity(
          
          titulo: addRecipeDto.titulo,
          textoReceita: addRecipeDto.textoReceita);
      return addRecipeEntity;
    } catch (e) {
      throw Exception("Erro ao criar receita: $e");
    }
  }
}
