import 'package:pokedex_sample/models/pokemon/pokemon.model.dart';
import 'package:pokedex_sample/models/pokemon_list_data/pokemon_list_data.model.dart';
import 'package:pokedex_sample/services/network_client/client.dart';

class PokemonService {
  Future<PokemonListData> fetchPokemons(
          {int offset = 0, int limit = 20}) async =>
      await networkClient.get(
        'pokemon',
        queryParameters: {
          "offset": offset,
          "limit": limit,
        },
      ).then((res) => PokemonListData.fromJson(res.data));

  Future<Pokemon> fetchPokemonDetails({int pokemonId = 1}) async =>
      await networkClient
          .get('pokemon/$pokemonId')
          .then((res) => Pokemon.fromJson(res.data));
}
