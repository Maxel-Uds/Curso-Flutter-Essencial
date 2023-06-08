import 'dart:ui';

import 'package:flutter/material.dart';

class Dog {
  String nome;
  String fotoId;

  Dog(this.nome, this.fotoId);
}

/*
Quando o código contido no onPressed: () { setState(() {}) } é executado
o Flutter chama o método build() novamente e redesenha a tela
*/

class HelloListView extends StatefulWidget {
  const HelloListView({super.key});

  @override
  State<HelloListView> createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _gridView = false;
                  });
                },
                icon: const Icon(Icons.list)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _gridView = true;
                  });
                },
                icon: const Icon(Icons.grid_on)),
          ],
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
      child: _view(dogs, _gridView),
    );
  }

  _view(List<Dog> dogs, bool gridView) {
    if (gridView) {
      return GridView.builder(
          itemCount: dogs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    }

    return ListView.builder(
        itemExtent: 300,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        });
  }

  _itemView(List<Dog> dogs, int index) {
    return Stack(fit: StackFit.expand, children: [
      _img(dogs[index]),
      Container(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black45, borderRadius: BorderRadius.circular(16)),
          child: Text(
            dogs[index].nome,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }

  _img(Dog dog) {
    return Image.asset(
      "assets/images/dog${dog.fotoId}.png",
      fit: BoxFit.cover,
    );
  }
}
