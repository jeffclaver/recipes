import 'package:dio/dio.dart';
import 'package:recipes/features/data/datasources/i_recipes_datasource.dart';
import 'package:recipes/features/data/dto/recipes_dto.dart';

class RecipesDatasource implements IRecipesDatasource {
  RecipesDatasource(this.dio);

  final Dio dio;
  final url = "http://192.168.15.13:3000/api/receitas";

  @override
  Future<List<RecipesDto>> fetchRecipe() async {
    try {
      final response = await dio.get(url);
      final List<dynamic> data = response.data;
      return data.map((json) => RecipesDto.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Erro ao buscar receitas $e");
    }
  }

  @override
  Future<RecipesDto> createRecipe(String title, String text) async{
   try{
    final response = await dio.post(url, data: {
      'titulo': title,
      'texto_receita': text,
    });
    return RecipesDto.fromJson(response.data);
   }
   catch(e){
    throw Exception("Erro ao criar receita $e");
   }
  }
}
