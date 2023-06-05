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

  _body(BuildContext context) {
    return Container(
      child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _text(),
              _pageView(),
              _buttons(context),
            ],
          )),
    );
  }

  _pageView() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
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

  _buttons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_button("ListView", context), _button("Page 2", context), _button("Page 3", context)],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_button("Snack", context), _button("Dialog", context), _button("Toast", context)],
          ),
        )
      ],
    );
  }

  _button(String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onClick(context),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  _onClick(BuildContext context) {
    Navigator.push(context, route);
  }

  _img(String id) {
    return Image.asset(
      "assets/images/dog$id.png",
    );
  }

  _text() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        "Hello Flutter",
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
        ),
      ),
    );
  }
}
