import 'dart:ui';

import 'package:flutter/material.dart';

class Dog {
  String nome;
  String fotoId;

  Dog(this.nome, this.fotoId);
}

class HelloListView extends StatelessWidget {
  const HelloListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
          centerTitle: true,
        ),
        body: _body(context));
  }

  _body(BuildContext context) {
    List<Dog> dogs = [
      Dog("Dog 1", "1"),
      Dog("Dog 2", "2"),
      Dog("Dog 3", "3"),
      Dog("Dog 4", "4"),
      Dog("Dog 5", "5"),
    ];

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
          itemCount: dogs.length,
          itemExtent: 300,
          itemBuilder: (context, index) {
          return _img(dogs[index]);
      }),
    );
  }

  _img(Dog dog) {
    return Image.asset(
      "assets/images/dog${dog.fotoId}.png",
      fit: BoxFit.cover,
    );
  }
}
