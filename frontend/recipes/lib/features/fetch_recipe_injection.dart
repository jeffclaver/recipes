part of '../core/config/inject.dart';

Future<void> _fetchRecipesInjection() async {
  di.registerFactory<RecipesBloc>(
    () => RecipesBloc(
      di<FetchRecipeUsecase>(),
    ),
  );
  di.registerLazySingleton<FetchRecipeUsecase>(
    () => FetchRecipeUsecase(
      di<IFetchRecipeRepository>(),
    ),
  );
  di.registerLazySingleton<IFetchRecipeRepository>(
    () => FetchRecipesRepository(
      di<IfetchRecipeDatasource>(),
    ),
  );
  di.registerLazySingleton<IfetchRecipeDatasource>(() => FetchRecipesDatasource(Dio()));
}
