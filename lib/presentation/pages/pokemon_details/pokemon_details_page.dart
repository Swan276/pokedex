import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/constants/pokemon_types.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/presentation/pages/pokemon_details/widgets/pokemon_details_title.dart';
import 'package:pokedex/routes/routes.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late final String name;
  late final String entry;
  late final String description;
  late final List<PokemonTypes> types;
  late final AssetGenImage assetImage;
  late final Color bgColor;

  @override
  void initState() {
    if (pokemons.containsKey(widget.id)) {
      final (
        pokemonName,
        pokemonEntry,
        pokemonDescription,
        pokemonType,
        pokemonAssetImage,
        pokemonBgColor
      ) = pokemons[widget.id]!;
      name = pokemonName;
      entry = pokemonEntry;
      description = pokemonDescription;
      types = pokemonType;
      assetImage = pokemonAssetImage;
      bgColor = pokemonBgColor;
    } else {
      context.go(Routes.unknown.path);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: PokemonDetailsTitle(
                name: name,
                entry: entry,
                description: description,
                types: types,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Assets.images.pokeball.image(
                      color: Colors.white.withOpacity(0.2),
                      fit: BoxFit.contain,
                    ),
                    assetImage.image(
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final pokemons = <String,
    (String, String, String, List<PokemonTypes>, AssetGenImage, Color)>{
  "1": (
    "Raichu",
    "0026",
    "Mouse Pokémon",
    [PokemonTypes.electric],
    Assets.images.raichu,
    const Color(0xFFF9CF30)
  ),
  "2": (
    "Charizard",
    "0026",
    "Mouse Pokémon",
    [PokemonTypes.fire, PokemonTypes.flying],
    Assets.images.charizard,
    const Color(0xFFF57D31)
  ),
  "3": (
    "Umbreon",
    "0026",
    "Mouse Pokémon",
    [PokemonTypes.dark],
    Assets.images.umbreon,
    const Color(0xFF212121)
  ),
};
