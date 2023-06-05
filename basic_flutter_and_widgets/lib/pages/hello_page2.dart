import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
        centerTitle: true,
      ),
    );
  }
}
