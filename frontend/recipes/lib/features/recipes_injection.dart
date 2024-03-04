part of '../core/config/inject.dart';

Future<void> _recipesInjection() async {
  di.registerFactory<RecipesBloc>(
    () => RecipesBloc(
      di<RecipesUsecase>(),
    ),
  );
  di.registerLazySingleton<RecipesUsecase>(
    () => RecipesUsecase(
      di<IRecipesRepository>(),
    ),
  );
  di.registerLazySingleton<IRecipesRepository>(
    () => RecipesRepository(
      di<IRecipesDatasource>(),
    ),
  );
  di.registerLazySingleton<IRecipesDatasource>(() => RecipesDatasource(Dio()));
}
