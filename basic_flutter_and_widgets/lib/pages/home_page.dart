import 'package:basic_flutter_and_widgets/pages/hello_page1.dart';
import 'package:basic_flutter_and_widgets/pages/hello_page2.dart';
import 'package:basic_flutter_and_widgets/pages/hello_page3.dart';
import 'package:basic_flutter_and_widgets/widgets/blue_button.dart';
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
          children: [BlueButton(text: "ListView", onClick: () => _onClickNavigator(context, const HelloPage1())), BlueButton(text: "Page 2", onClick: () => _onClickNavigator(context, const HelloPage2())), BlueButton(text: "Page 3", onClick: () => _onClickNavigator(context, const HelloPage3()))],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [BlueButton(text:"Snack", onClick: _onClickSnack), BlueButton(text: "Dialog", onClick: _onClickDialog), BlueButton(text: "Toast", onClick: _onClickToast)],
          ),
        )
      ],
    );
  }

  _onClickNavigator(BuildContext context, Widget page) async {
    String message = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));

    print(message);
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
