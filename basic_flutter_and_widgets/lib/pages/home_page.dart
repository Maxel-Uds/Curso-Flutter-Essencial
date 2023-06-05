import 'package:basic_flutter_and_widgets/pages/hello_page1.dart';
import 'package:basic_flutter_and_widgets/pages/hello_page2.dart';
import 'package:basic_flutter_and_widgets/pages/hello_page3.dart';
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
          children: [_button("ListView", context, () => _onClickNavigator(context, const HelloPage1())), _button("Page 2", context, () => _onClickNavigator(context, const HelloPage2())), _button("Page 3", context, () => _onClickNavigator(context, const HelloPage3()))],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_button("Snack", context, _onClickSnack), _button("Dialog", context, _onClickDialog), _button("Toast", context, _onClickToast)],
          ),
        )
      ],
    );
  }

  _button(String text, BuildContext context, Function onClick) {
    return ElevatedButton(
      onPressed: () => onClick(),
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

  _onClickNavigator(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));
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

  _onClickSnack() {}

  _onClickDialog() {}

  _onClickToast() {}
}
