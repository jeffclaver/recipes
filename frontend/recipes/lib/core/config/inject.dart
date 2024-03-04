import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes/features/data/datasources/recipes_datasource.dart';
import 'package:recipes/features/data/datasources/i_recipes_datasource.dart';
import 'package:recipes/features/data/repositories/recipes_repository.dart';
import 'package:recipes/features/domain/repositories/i_recipes_repository.dart';
import 'package:recipes/features/domain/usecases/recipes_usecase.dart';
import 'package:recipes/features/presentation/bloc/recipes_bloc.dart';

part '../../features/recipes_injection.dart';

final di = GetIt.instance;

Future<void> initCore() async {
  await _recipesInjection();
}
