import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_listener/hive_listener.dart';
import 'package:pokedex_sample/services/database/database_service.dart';

class FavoritePokemonButton extends StatelessWidget {
  const FavoritePokemonButton({
    super.key,
    required this.pokemonId,
  });

  final String pokemonId;

  setAsFavorite(bool value) {
    Hive.box(DatabaseService.favoritePokemonBoxKey).put(pokemonId, value);
  }

  @override
  Widget build(BuildContext context) {
    return HiveListener(
      box: Hive.box(DatabaseService.favoritePokemonBoxKey),
      keys: [pokemonId],
      builder: (box) {
        if (box.get(pokemonId, defaultValue: false) == true) {
          return IconButton(
            onPressed: () => setAsFavorite(false),
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          );
        }

        return IconButton(
          onPressed: () => setAsFavorite(true),
          icon: const Icon(Icons.favorite_border),
          color: Colors.red,
        );
      },
    );
  }
}
