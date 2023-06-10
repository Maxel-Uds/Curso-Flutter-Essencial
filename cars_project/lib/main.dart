import 'package:cars_project/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: _brightness,
      ),
      home: LoginPage(_buildIconButtonList()),
    );
  }

  Row _buildIconButtonList() {
    return _brightness.name.startsWith(Brightness.light.name) ?
    _buildDarkModeButton(const Icon(Icons.toggle_off), () => _switchBrightness(Brightness.dark)) :
    _buildDarkModeButton(const Icon(Icons.toggle_on), () => _switchBrightness(Brightness.light));
  }

  _buildDarkModeButton(Icon icon, Function switchTheme) {
    return Row(
      children: [
        const Text("Dark Mode", style: TextStyle(fontSize: 20)),
        const SizedBox(width: 5),
        IconButton(
          onPressed: () => switchTheme(),
          icon: icon,
          tooltip: "DarkMode",
          iconSize: 35,
        )
      ],
    );
  }

  _switchBrightness(Brightness brightness) {
    setState(() {
      _brightness = brightness;
    });
  }
}
