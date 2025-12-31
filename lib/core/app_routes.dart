import 'package:cubit_practice/features/presentaion/pages/splash_page.dart';
import 'package:flutter/material.dart';

import '../features/domain/character_entity.dart';
import '../features/presentaion/pages/character_details_page.dart';
import '../features/presentaion/pages/character_page.dart';

class AppRoutes {
  static const String splashPage = '/';
  static const String characterPage = '/characterPage';
  static const String characterDetailsPage = '/characterDetails';

  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        // CharacterPage gets data from Bloc, no arguments needed
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case characterPage:
        // CharacterPage gets data from Bloc, no arguments needed
        return MaterialPageRoute(builder: (_) => const CharacterPage());

      case characterDetailsPage:
        // Cast argument as CharacterEntity (matches repository/Cubit)
        final character = settings.arguments as CharacterEntity;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsPage(character: character),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
