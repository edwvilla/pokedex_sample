import 'package:flutter/material.dart';

Color colorByPokemonType(String type) {
  switch (type) {
    case 'normal':
      return Colors.brown;
    case 'fighting':
      return Colors.red;
    case 'flying':
      return Colors.blue;
    case 'poison':
      return Colors.purple;
    case 'ground':
      return Colors.brown[700]!;

    case 'rock':
      return Colors.brown[300]!;
    case 'bug':
      return Colors.green;
    case 'ghost':
      return Colors.indigo[900]!;
    case 'steel':
      return Colors.blueGrey;
    case 'fire':
      return Colors.red[900]!;
    case 'water':
      return Colors.blue[900]!;
    case 'grass':
      return Colors.green[900]!;
    case 'electric':
      return Colors.yellow[900]!;
    case 'psychic':
      return Colors.pink[900]!;
    case 'ice':
      return Colors.lightBlue[300]!;
    case 'dragon':
      return Colors.deepPurple[900]!;
    case 'dark':
      return Colors.grey[900]!;
    case 'fairy':
      return Colors.pink[300]!;

    default:
      return Colors.grey[300]!;
  }
}
