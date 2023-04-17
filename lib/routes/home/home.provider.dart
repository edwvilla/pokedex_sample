import 'package:flutter/material.dart';
import 'package:pokedex_sample/models/pokemon_list_object/pokemon_list_object.model.dart';
import 'package:pokedex_sample/services/network_client/fetch_status.dart';
import 'package:pokedex_sample/services/pokemon_service/pokemon_service.dart';

class HomeProvider extends ChangeNotifier {
  final pokemonService = PokemonService();

  List<PokemonListObject> _pokemons = [];
  List<PokemonListObject> get pokemons => _pokemons;
  set pokemons(List<PokemonListObject> value) {
    _pokemons = value;
    notifyListeners();
  }

  String nextUrl = "";

  FetchStatus _status = FetchStatus.idle;
  FetchStatus get status => _status;
  set status(FetchStatus value) {
    _status = value;
    notifyListeners();
  }

  final scrollController = ScrollController();

  void fetchPokemons() async {
    status = FetchStatus.loading;
    await pokemonService.fetchPokemons().then((value) {
      pokemons = value.results;
      nextUrl = value.next;
      status = FetchStatus.done;
    }).catchError((err) {
      status = FetchStatus.error;
    });
  }

  void fetchNextPokemons() async {
    if (nextUrl.isEmpty) return;

    final int nextOffset =
        int.parse(Uri.parse(nextUrl).queryParameters["offset"].toString());

    await pokemonService.fetchPokemons(offset: nextOffset).then((value) {
      pokemons = [...pokemons, ...value.results];
    }).catchError((err) {
      status = FetchStatus.error;
    });
  }

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchNextPokemons();
    }
  }
}
