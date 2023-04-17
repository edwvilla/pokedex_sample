import 'package:flutter/material.dart';
import 'package:pokedex_sample/models/pokemon/pokemon.model.dart';
import 'package:pokedex_sample/routes/pokemon_details/pokemon_details.view.dart';
import 'package:pokedex_sample/services/network_client/fetch_status.dart';
import 'package:pokedex_sample/services/pokemon_service/pokemon_service.dart';

class PokemonCardController {
  FetchStatus status = FetchStatus.idle;

  void setStatusLoading() {
    status = FetchStatus.loading;
  }

  void setStatusDone() {
    status = FetchStatus.done;
  }

  void setStatusError() {
    status = FetchStatus.error;
  }

  Pokemon? pokemon;

  fetchPokemonDetails({required String url}) async {
    final splittedUrl = url.split('/');
    final pokemonId = splittedUrl[6];
    return await PokemonService()
        .fetchPokemonDetails(pokemonId: int.parse(pokemonId))
        .then((value) {
      pokemon = value;
    }).catchError((err) {});
  }

  void goToPokemonDetails(BuildContext context, Pokemon pokemon) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokemonDetailsView(pokemon: pokemon)));
  }
}
