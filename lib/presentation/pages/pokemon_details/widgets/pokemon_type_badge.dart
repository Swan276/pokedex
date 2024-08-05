import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon_types.dart';

class PokemonTypeBadge extends StatelessWidget {
  const PokemonTypeBadge({super.key, required this.type});

  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: type.color,
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        type.displayName,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
