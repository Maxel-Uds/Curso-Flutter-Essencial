import 'package:cars_project/api/pokemon_api.dart';
import 'package:cars_project/main.dart';
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
    // MyApp.of(context).changeTheme(Brightness.dark);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pokemons"),
          actions: [_buildIconButtonList()],
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

  Row _buildIconButtonList() {
    return MyApp.of(context).brightness.name.startsWith(Brightness.light.name) ?
    _buildThemeModeButton(Icons.toggle_off, () => setState(() => MyApp.of(context).changeTheme(Brightness.dark)), Icons.dark_mode) :
    _buildThemeModeButton(Icons.toggle_on, () => setState(() => MyApp.of(context).changeTheme(Brightness.light)), Icons.sunny);
  }

  Row _buildThemeModeButton(IconData toggle, Function switchTheme, IconData themeIcon) {
    return Row(
      children: [
        Icon(themeIcon),
        const SizedBox(width: 5),
        IconButton(
          onPressed: () => switchTheme(),
          icon: Icon(toggle),
          tooltip: "DarkMode",
          iconSize: 35,
        )
      ],
    );
  }
}

