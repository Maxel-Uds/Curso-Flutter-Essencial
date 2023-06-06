import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({Key? key, required this.text, required this.onClick})
      : super(key: key);

  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick(),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
