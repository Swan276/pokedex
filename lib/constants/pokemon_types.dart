import 'package:flutter/cupertino.dart';

enum PokemonTypes {
  electric(Color.fromARGB(255, 251, 201, 62)),
  fire(Color.fromARGB(255, 251, 201, 62)),
  flying(Color.fromARGB(255, 251, 201, 62)),
  dark(Color.fromARGB(255, 251, 201, 62));

  const PokemonTypes(this.color);

  final Color color;

  String get displayName =>
      "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
}
