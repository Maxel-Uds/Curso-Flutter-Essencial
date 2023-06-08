import 'package:flutter/material.dart';

import 'hello_listview.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  const DogPage(this.dog, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(
        "assets/images/dog${dog.fotoId}.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
