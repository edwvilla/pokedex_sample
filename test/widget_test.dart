import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_sample/services/pokemon_service/pokemon_service.dart';

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  // TEST POKEMON SERVICE
  group('Pokemon Service', () {
    test('Should get a list of 20 objects from api', () async {
      final pokemonService = PokemonService();

      final pokemonListData = await pokemonService.fetchPokemons();

      expect(pokemonListData.results.length, 20);
    });

    test('Should get a list of 20 objects from api with offset 20', () async {
      final pokemonService = PokemonService();

      final pokemonListData = await pokemonService.fetchPokemons(offset: 20);

      expect(pokemonListData.results.length, 20);
    });

    test('Should get a list of 20 objects from api with limit 10', () async {
      final pokemonService = PokemonService();

      final pokemonListData = await pokemonService.fetchPokemons(limit: 10);

      expect(pokemonListData.results.length, 10);
    });

    test('Should get the detail of a pokemon', () async {
      final pokemonService = PokemonService();

      final pokemon = await pokemonService.fetchPokemonDetails(pokemonId: 1);

      expect(pokemon.name, 'bulbasaur');
    });
  });
}
