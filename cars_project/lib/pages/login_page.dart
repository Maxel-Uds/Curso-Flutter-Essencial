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
      body: _body(),
    );
  }

  _body() {
    return Container();
  }
}
