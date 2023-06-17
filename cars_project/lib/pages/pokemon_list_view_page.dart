import 'package:cars_project/model/api_response.dart';
import 'package:cars_project/model/pokemon_response.dart';

import 'package:flutter/material.dart';

import '../api/pokemon_api.dart';
import '../utils/alert.dart';

class PokemonListViewPage extends StatefulWidget {
  final String letter;

  const PokemonListViewPage(this.letter, {super.key});

  @override
  State<PokemonListViewPage> createState() => _PokemonListViewPageState();
}

class _PokemonListViewPageState extends State<PokemonListViewPage> with AutomaticKeepAliveClientMixin<PokemonListViewPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  Widget _body() {
    Future<ApiResponse<List<PokemonResponse>>> pokemonResponsesFuture = PokemonApi.getPokemonList();

    return FutureBuilder(
        future: pokemonResponsesFuture,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return snapshot.data!.ok ? _listView(snapshot.data!.result) : alert(context, snapshot.data?.msg);
          }

          return const Center(child: CircularProgressIndicator());
        });
  }

  Container _listView(List<PokemonResponse> pokemonResponseList) {
    List<PokemonResponse> filteredItems = _filterPokemons(pokemonResponseList);

    return Container(
      padding: const EdgeInsets.all(2),
      child: ListView.builder(
          itemCount: filteredItems.isNotEmpty ? filteredItems.length : 0,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[200],
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(filteredItems.elementAt(index).sprite, width: 170)),
                    Text(filteredItems.elementAt(index).name, style: const TextStyle(fontSize: 22), maxLines: 1),
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

  List<PokemonResponse> _filterPokemons(List<PokemonResponse> pokemonList) {
    return pokemonList.isNotEmpty ? pokemonList.where((pokemon) => pokemon.name.startsWith(widget.letter)).toList() : [];
  }

  @override
  bool get wantKeepAlive => true;
}
