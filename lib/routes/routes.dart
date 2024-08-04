import 'package:pokedex/routes/route_paths.dart';

enum Routes {
  splash(RoutePaths.splash),
  home(RoutePaths.home),
  pokemonDetails(RoutePaths.pokemonDetails),
  unknown(RoutePaths.unknown);

  const Routes(this.path);

  final String path;
}
