import 'package:cars_project/model/api_response.dart';
import 'package:cars_project/model/pokemon_response.dart';

import 'package:flutter/material.dart';

import '../api/pokemon_api.dart';
import '../utils/alert.dart';

class PokemonsListViewPage extends StatelessWidget {
  const PokemonsListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    Future<ApiResponse<List<PokemonResponse>>> pokemonResponsesFuture = PokemonApi.getPokemonList();

    return FutureBuilder(
        future: pokemonResponsesFuture,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return snapshot.data!.ok ? _listView(snapshot.data?.result) : alert(context, snapshot.data?.msg);
          }

          return const Center(child: CircularProgressIndicator());
        });
  }

  Container _listView(List<PokemonResponse>? items) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: ListView.builder(
          itemCount: items != null ? items.length : 0,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[200],
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(items!.elementAt(index).sprite!, width: 170)),
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
}
