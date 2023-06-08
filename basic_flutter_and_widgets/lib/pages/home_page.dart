import 'package:basic_flutter_and_widgets/pages/hello_listview.dart';
import 'package:basic_flutter_and_widgets/pages/hello_page2.dart';
import 'package:basic_flutter_and_widgets/pages/hello_page3.dart';
import 'package:basic_flutter_and_widgets/widgets/blue_button.dart';
import 'package:basic_flutter_and_widgets/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../utils/nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
          bottom: const TabBar(tabs: [
            Tab(text: "Tab 1"),
            Tab(text: "Tab 2"),
          ]),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            _body(context),
            _body(context),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _onClickFab(),
            ),
            /* Objeto usado para adicionar um espaço no sentido altura ou largura */
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              child: const Icon(Icons.favorite),
              onPressed: () => _onClickFab(),
            ),
          ],
        ),
        drawer: const DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print("FAB");
  }

  _body(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _text(),
            _pageView(context),
            _buttons(),
          ],
        ));
  }

  _pageView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 300,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: PageView(
          children: [
            _img("1"),
            _img("2"),
            _img("3"),
            _img("4"),
            _img("5"),
          ],
        ),
      ),
    );
  }

  _buttons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueButton(
                  text: "ListView",
                  onClick: () => _onClickNavigator(context, HelloListView())),
              BlueButton(
                  text: "Page 2",
                  onClick: () =>
                      _onClickNavigator(context, const HelloPage2())),
              BlueButton(
                  text: "Page 3",
                  onClick: () => _onClickNavigator(context, const HelloPage3()))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton(
                    text: "Snack", onClick: () => _onClickSnack(context)),
                BlueButton(
                    text: "Dialog", onClick: () => _onClickDialog(context)),
                BlueButton(text: "Toast", onClick: _onClickToast)
              ],
            ),
          )
        ],
      );
    });
  }

  _onClickNavigator(BuildContext context, Widget page) async {
    String message = await push(context, page);
    print(message);
  }

  _img(String id) {
    return Image.asset(
      "assets/images/dog$id.png",
    );
  }

  _text() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Text(
        "Hello Flutter",
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
        ),
      ),
    );
  }

  _onClickSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá, Flutter!"),
        action: SnackBarAction(
            textColor: Colors.green,
            label: "Ok",
            onPressed: () {
              print("OK!");
            }),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Flutter Dialog!"),
            actions: [
              TextButton(
                  child: const Text("Calcelar"),
                  onPressed: () => Navigator.pop(context)),
              TextButton(
                  child: const Text("Ok"),
                  onPressed: () => Navigator.pop(context)),
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
