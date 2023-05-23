import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_text(), _img(), _button()],
        ));
  }

  _button() {
    return ElevatedButton(
      onPressed: () => _onClick(),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.yellow),
      ),
      child: const Text(
        "Olá Mundo!",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _onClick() {
    print("Olá Mundo!");
  }

  _img() {
    return Image.asset(
      "assets/images/dog1.png",
      width: 300,
      height: 300,
    );
  }

  _text() {
    return const Text(
      "Hello Flutter",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
      ),
    );
  }
}
