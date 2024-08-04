import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/routes/routes.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late final String name;
  late final AssetGenImage assetImage;
  late final Color bgColor;

  @override
  void initState() {
    if (pokemons.containsKey(widget.id)) {
      final (pokemonName, pokemonAssetImage, pokemonBgColor) =
          pokemons[widget.id]!;
      name = pokemonName;
      assetImage = pokemonAssetImage;
      bgColor = pokemonBgColor;
    } else {
      context.go(Routes.unknown.path);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: assetImage.image(),
        ),
      ),
    );
  }
}

final pokemons = <String, (String, AssetGenImage, Color)>{
  "1": ("Raichu", Assets.images.raichu, const Color(0xFFF9CF30)),
  "2": ("Charizard", Assets.images.charizard, const Color(0xFFF57D31)),
  "3": ("Umbreon", Assets.images.umbreon, const Color(0xFF212121)),
};
