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
          children: [
            _text(),
            _pageView(),
            _buttons(),
          ],
        ));
  }

  SizedBox _pageView() {
    return SizedBox(
      width: 300,
      height: 300,
      child: PageView(
        children: [
          _img("1"),
          _img("2"),
          _img("3"),
          _img("4"),
          _img("5"),
        ],
      ),
    );
  }

  _buttons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_button("ListView"), _button("Page 2"), _button("Page 3")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_button("Snack"), _button("Dialog"), _button("Toast")],
        )
      ],
    );
  }

  _button(String text) {
    return ElevatedButton(
      onPressed: () => _onClick(),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.yellow),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  _onClick() {
    print("Olá Mundo!");
  }

  _img(String id) {
    return Image.asset(
      "assets/images/dog$id.png",
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
