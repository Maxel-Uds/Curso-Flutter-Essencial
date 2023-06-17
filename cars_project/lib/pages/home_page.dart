import 'package:cars_project/pages/pokemon_list_view_page.dart';
import 'package:cars_project/widgets/drawer_list.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pokemons"),
      ),
      body: const PokemonsListViewPage(),
      drawer: DrawerList("Maxel Udson", "maxellopes32@gmail.com"),
    );
  }


}
