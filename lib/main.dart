import 'package:flutter/material.dart';
import 'package:pokedex/routes/route_manager.dart';
import 'package:pokedex/utils/themes/ui_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokédex',
      routerConfig: RouteManager.router,
      theme: ThemeData(
        scaffoldBackgroundColor: UIColors.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
