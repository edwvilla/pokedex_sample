import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:pokedex_sample/models/pokemon/pokemon.model.dart';
import 'package:pokedex_sample/utils/color_by_pokemon_type.dart';
import 'package:pokedex_sample/widgets/favorite_pokemon_button/favorite_pokemon_button.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorByPokemonType(pokemon.types.first.type.name)
                  .withOpacity(.05),
              Colors.white,
              Colors.white,
              Colors.white,
              colorByPokemonType(pokemon.types.last.type.name).withOpacity(.05),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              FavoritePokemonButton(pokemonId: pokemon.order.toString()),
            ],
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: ListView(
            children: [
              // Image
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: SizedBox.expand(
                        child: Image.asset('assets/pokeball.png'),
                      ),
                    ),
                    SizedBox.expand(
                      child: Image.network(
                        pokemon.sprites.frontDefault,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              // Name
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  pokemon.name.capitalize(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Types
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Wrap(
                  children: pokemon.types
                      .map(
                        (type) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: colorByPokemonType(type.type.name),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            type.type.name.capitalize(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              // Stats
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Stats',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...pokemon.stats
                        .map(
                          (stat) => Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    stat.stat.name.capitalize(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    stat.baseStat.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              // Progress bar
                              SizedBox(
                                height: 10,
                                child: LinearProgressIndicator(
                                  value: stat.baseStat / 100,
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    colorByPokemonType(
                                      pokemon.types.first.type.name,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),

              // Abilities
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Abilities',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...pokemon.abilities
                        .map(
                          (ability) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ability.ability.name.capitalize(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (ability.isHidden)
                                const Icon(
                                  Icons.visibility_off,
                                )
                              else
                                const Icon(
                                  Icons.visibility,
                                ),
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
