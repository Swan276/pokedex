import 'package:flutter/cupertino.dart';

enum PokemonTypes {
  electric(Color(0xFFFFCC33)),
  fire(Color(0xFFFF4422)),
  flying(Color(0xFF8899FF)),
  dark(Color(0xFF775544));

  const PokemonTypes(this.color);

  final Color color;

  String get displayName => name.toUpperCase();
}
