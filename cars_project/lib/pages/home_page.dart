import 'package:cars_project/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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

  _body() {
    return const Center(
      child: Text(
        "Home Page",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
