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

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Image.network(items.elementAt(index).sprite!),
              Flexible(child: Text(items.elementAt(index).name!, style: const TextStyle(fontSize: 22), maxLines: 1))
            ],
          );
        });
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
