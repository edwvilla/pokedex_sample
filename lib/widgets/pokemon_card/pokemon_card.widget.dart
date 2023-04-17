import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:pokedex_sample/models/pokemon_list_object/pokemon_list_object.model.dart';
import 'package:pokedex_sample/services/database/database_service.dart';
import 'package:pokedex_sample/services/network_client/fetch_status.dart';
import 'package:pokedex_sample/utils/color_by_pokemon_type.dart';
import 'package:pokedex_sample/widgets/favorite_pokemon_button/favorite_pokemon_button.dart';
import 'package:pokedex_sample/widgets/fetch_status/fetch_status.widget.dart';
import 'package:pokedex_sample/widgets/pokemon_card/pokemon_card.controller.dart';

class PokemonCardWidget extends StatefulWidget {
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  final PokemonListObject pokemon;

  @override
  State<PokemonCardWidget> createState() => _PokemonCardWidgetState();
}

class _PokemonCardWidgetState extends State<PokemonCardWidget> {
  final PokemonCardController _controller = PokemonCardController();

  @override
  void initState() {
    super.initState();
    // open pokemon box
    Future.microtask(() => DatabaseService.instance.hiveFavoritePokemonsBox);

    _controller.setStatusLoading();
    Future.microtask(() => setState(() {}));

    _controller.fetchPokemonDetails(url: widget.pokemon.url).then((value) {
      _controller.setStatusDone();
      Future.microtask(() => setState(() {}));
    }).catchError((err) {
      _controller.setStatusError();
      Future.microtask(() => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_controller.status == FetchStatus.done) {
          _controller.goToPokemonDetails(context, _controller.pokemon!);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'assets/pokeball.png',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FetchStatusWidget(
                    status: _controller.status,
                    loadingWidget: SizedBox(
                      width: 130,
                      height: 130,
                      child: // Shimmer animated circle with moving gradient
                          Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey[300]!,
                                Colors.grey[100]!,
                                Colors.grey[300]!,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    errorWidget: const SizedBox(
                      width: 130,
                      height: 130,
                      child: Placeholder(
                        color: Colors.red,
                      ),
                    ),
                    doneWidget: SizedBox(
                      width: 130,
                      height: 130,
                      child: Image.network(
                        _controller.pokemon?.sprites.frontDefault ??
                            'https://via.placeholder.com/150',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.pokemon.name.capitalize(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        FavoritePokemonButton(
                            pokemonId: widget.pokemon.getIdByUrl().toString()),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: Wrap(
                        spacing: 10,
                        children: [
                          for (final type in _controller.pokemon?.types ?? [])
                            Chip(
                              label: Text(
                                  type.type.name.toString().capitalize(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              backgroundColor:
                                  colorByPokemonType(type.type.name),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
