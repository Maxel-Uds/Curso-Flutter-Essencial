import 'package:cars_project/model/pokemon_response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  static late int _offset;

  final PagingController<int, Pokemon> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPokemonList(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _offset = 0;
    super.build(context);
    return _listView();
  }

  // Widget _body() {
  //   return FutureBuilder(
  //       future: pokemonResponsesFuture,
  //       builder: (context, snapshot) {
  //         if(snapshot.hasData) {
  //           return snapshot.data!.ok ? _listView(snapshot.data!.result) : alert(context, snapshot.data?.msg);
  //         }
  //
  //         return const Center(child: CircularProgressIndicator());
  //       });
  // }

  Future<void> _fetchPokemonList(int pageKey) async {
      PokemonApi.getPokemonList(_offset).then((response) {
          if(!response.ok) return _pagingController.error = alert(context, response.msg);

          List<Pokemon> filteredPokemonList = _filterPokemonList(response.result.pokemonList);

          if (response.result.isLastPage) {
            _pagingController.appendLastPage(filteredPokemonList);
          } else if(filteredPokemonList.isNotEmpty) {
            _offset += 10;
            final nextPageKey = pageKey + filteredPokemonList.length;
            _pagingController.appendPage(filteredPokemonList, nextPageKey);
          }
          else {
            _offset += 10;
            _fetchPokemonList(pageKey);
          }
      });
  }

  Container _listView() {
    return Container(
      padding: const EdgeInsets.all(2),
      child: PagedListView<int, Pokemon>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Pokemon>(itemBuilder: (context, pokemon, index) {
            return Card(
              color: Colors.grey[200],
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(pokemon.sprite, width: 170)),
                    Text(pokemon.name, style: const TextStyle(fontSize: 22, color: Colors.black), maxLines: 1),
                    const Text("Info", style: TextStyle(fontSize: 14, color: Colors.black), maxLines: 1),
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
      ),
    );
  }

  List<Pokemon> _filterPokemonList(List<Pokemon> pokemonList) {
    return pokemonList.isNotEmpty ? pokemonList.where((pokemon) => pokemon.name.startsWith(widget.letter)).toList() : [];
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
