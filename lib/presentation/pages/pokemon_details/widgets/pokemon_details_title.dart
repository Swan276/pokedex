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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "#$entry",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
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
