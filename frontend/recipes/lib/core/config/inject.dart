import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/features/data/datasources/fetch_recipes_datasource.dart';
import 'package:recipes/features/data/datasources/i_fetch_recipes_datasource.dart';
import 'package:recipes/features/data/repositories/fetch_recipes_repository.dart';
import 'package:recipes/features/domain/repositories/i_fetch_recipe_repository.dart';
import 'package:recipes/features/domain/usecases/fetch_recipe_usecase.dart';
import 'package:recipes/features/presentation/bloc/recipes_bloc.dart';

part '../../features/fetch_recipe_injection.dart';

final di = GetIt.instance;

Future<void> initCore() async {
  await _fetchRecipesInjection();
}
