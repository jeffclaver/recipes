import 'package:dio/dio.dart';
import 'package:recipes/features/data/datasources/i_fetch_recipes_datasource.dart';
import 'package:recipes/features/data/dto/recipe_dto.dart';

class FetchRecipesDatasource implements IfetchRecipeDatasource {
  FetchRecipesDatasource(this.dio);

  final Dio dio;
  final url = "http://192.168.15.13:3000/api/receitas";

  @override
  Future<List<RecipeDto>> fetchRecipe() async {
    final response = await dio.get(url);
    final List<dynamic> data = response.data;
    return data.map((json) => RecipeDto.fromJson(json)).toList();
  }
}
