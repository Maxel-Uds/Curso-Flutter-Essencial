import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AppButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: _button(label, onPressed),
    );
  }

  _button(String label, Function onPressed) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        label,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
