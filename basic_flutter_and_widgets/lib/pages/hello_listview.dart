import 'dart:ui';

import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  const HelloListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
          centerTitle: true,
        ),
        body: _body(context));
  }

  _body(BuildContext context) {
    List<Widget> imgs = [
      _img("1"),
      _img("2"),
      _img("3"),
      _img("4"),
      _img("5"),
    ];

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
          itemCount: imgs.length,
          itemExtent: 300,
          itemBuilder: (context, index) {
          return imgs[index];
      }),
    );
  }

  _img(String id) {
    return Image.asset(
      "assets/images/dog$id.png",
      fit: BoxFit.cover,
    );
  }
}
