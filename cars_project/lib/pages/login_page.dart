import 'package:cars_project/pages/page_one.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Row _iconsButtons;

  const LoginPage(this._iconsButtons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(fontSize: 20)),
        actions: [_iconsButtons],
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const PageOne())),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100, 50)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.blue),
        ),
        child: const Text(
          "Próxima página",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
