import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool showProgress;

  const AppButton({super.key, required this.label, required this.onPressed, required this.showProgress});

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
      child: showProgress ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : Text(
        label,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
