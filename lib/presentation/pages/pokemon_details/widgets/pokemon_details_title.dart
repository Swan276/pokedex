import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_types.dart';
import 'package:pokedex/presentation/pages/pokemon_details/widgets/pokemon_type_badge.dart';

class PokemonDetailsTitle extends StatelessWidget {
  const PokemonDetailsTitle({
    super.key,
    required this.name,
    required this.entry,
    required this.description,
    required this.types,
  });

  final String name;
  final String entry;
  final String description;
  final List<PokemonTypes> types;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Raichu",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "#0026",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Text(
          "Mouse Pokémon",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 32,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: types.length,
            itemBuilder: (context, index) {
              return PokemonTypeBadge(type: types[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }
}
