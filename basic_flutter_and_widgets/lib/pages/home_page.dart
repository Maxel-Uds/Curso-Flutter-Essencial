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
      body: _body(context),
    );
  }

  _body(context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _button(),
          _button(),
          _button()
        ],
      )
    );
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
      "assets/images/dog4.png",
      fit: BoxFit.cover,
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
