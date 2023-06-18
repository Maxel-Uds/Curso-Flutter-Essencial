import 'package:cars_project/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  // Adicionar esse método of() no StatefulWidget torna seu objeto State acessível para qualquer widget descendente
  static MyAppState of(BuildContext context) => context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: _brightness,
      ),
      home: const LoginPage(),
    );
  }

  void changeTheme(Brightness brightness) {
    setState(() {
      _brightness = brightness;
    });
  }

  Brightness get brightness => _brightness;
}
