import 'package:cars_project/model/pokemon_item.dart';
import 'package:cars_project/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

import '../api/pokemon_api.dart';
import '../model/pokemon_response.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList("Maxel Udson", "maxellopes32@gmail.com"),
    );
  }

  Widget _body() {
    List<PokemonItem> items = _getPokemonItems();

    return Container(
      padding: const EdgeInsets.all(2),
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[200],
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(items.elementAt(index).sprite!, width: 170)),
                    Text(items.elementAt(index).name!, style: const TextStyle(fontSize: 22), maxLines: 1),
                    const Text("Info", style: TextStyle(fontSize: 14), maxLines: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('INFO'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('SHARE'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  List<PokemonItem> _getPokemonItems() {
    return PokemonApi.getPokemon("nome");
      // _pokemonList().map<PokemonItem>((pokemon) {
      //  PokemonApi.getPokemon(pokemon.name!).map<void>((p) => p);
      // }).toList();
  }

  List<PokemonResponse> _pokemonList() {
    return PokemonApi.getPokemonList();
  }
}
