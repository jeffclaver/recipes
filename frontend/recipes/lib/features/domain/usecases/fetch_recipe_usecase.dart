import 'package:recipes/features/domain/entities/recipe_entity.dart';
import 'package:recipes/features/domain/repositories/i_fetch_recipe_repository.dart';
import 'package:recipes/features/domain/usecases/i_fetch_recipe_usecase.dart';

class FetchRecipeUsecase implements IFetchRecipeUsecase{

  FetchRecipeUsecase(this.repository);
  final IFetchRecipeRepository repository;

  @override
  Future<List<RecipeEntity>> call() async{
    return await repository.fetchRecipes();
  }
} 