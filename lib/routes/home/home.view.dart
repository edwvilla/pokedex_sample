import 'package:flutter/material.dart';
import 'package:pokedex_sample/routes/home/home.provider.dart';
import 'package:pokedex_sample/widgets/fetch_status/fetch_status.widget.dart';
import 'package:pokedex_sample/widgets/pokemon_card/pokemon_card.widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    // fetch data
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = context.read<HomeProvider>();
      provider.fetchPokemons();
      provider.scrollController.addListener(provider.onScroll);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      body: FetchStatusWidget(
        status: provider.status,
        loadingWidget: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
        doneWidget: ListView.builder(
          controller: provider.scrollController,
          shrinkWrap: true,
          itemCount: provider.pokemons.length,
          itemBuilder: (context, index) =>
              PokemonCardWidget(pokemon: provider.pokemons[index]),
        ),
        errorWidget: Container(),
      ),
    );
  }
}
