import 'package:flutter/material.dart';

import '../widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(child: BlueButton(text: "Voltar", onClick: () => _onClickVoltar(context)));
  }
  
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Tela 2");
  }
}
