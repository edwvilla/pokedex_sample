import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();
  static const String favoritePokemonBoxKey = 'favoritePokemons';
  get hiveFavoritePokemonsBox async =>
      await Hive.openBox(favoritePokemonBoxKey);

  get favoritePokemonBox async => await Hive.openBox(favoritePokemonBoxKey);
  Future addFavoritePokemon(int pokemonId) async =>
      await hiveFavoritePokemonsBox.put(pokemonId, true);

  Future removeFavoritePokemon(int pokemonId) async =>
      await hiveFavoritePokemonsBox.delete(pokemonId);
}
