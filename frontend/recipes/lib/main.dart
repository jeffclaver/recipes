import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes/core/config/app_config.dart';

import 'features/presentation/pages/recipes_page.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppConfig.initConfigApp();
    runApp(const RecipeApp());
  }, (error, stack) {
    debugPrint("<====== ERROR AO INICIAR APP =====> ");
    debugPrint("- E R R O R: $error");
    debugPrint("- S T A C K: $stack");
    runApp(MaterialApp(
      home: ErrorWidget(error),
    ));
  });
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      initialRoute: '/',
      routes: {'/': (context) => const RecipePage()},
    );
  }
}
