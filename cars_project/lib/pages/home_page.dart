import 'package:cars_project/api/pokemon_api.dart';
import 'package:cars_project/pages/pokemon_list_view_page.dart';
import 'package:cars_project/widgets/drawer_list.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pokemons"),
          bottom: const TabBar(tabs: [
            Tab(text: "A"),
            Tab(text: "B"),
            Tab(text: "C"),
            Tab(text: "D")
          ],),
        ),
        body: const TabBarView(children: [
          PokemonListViewPage(Letter.A),
          PokemonListViewPage(Letter.B),
          PokemonListViewPage(Letter.C),
          PokemonListViewPage(Letter.D)
        ]),
        drawer: DrawerList("Maxel Udson", "maxellopes32@gmail.com"),
      ),
    );
  }
}
