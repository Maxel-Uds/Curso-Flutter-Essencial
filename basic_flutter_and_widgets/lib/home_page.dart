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
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "Hello Flutter",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}