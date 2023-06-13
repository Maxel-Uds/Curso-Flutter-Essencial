import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassInput;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType? keyBoardType;
  final TextInputAction? inputAction;
  final FocusNode? focus;
  final FocusNode? nextFocus;

  const AppText({
    super.key,
    required this.label,
    required this.hint,
    this.isPassInput = false,
    required this.controller,
    required this.validator,
    this.keyBoardType,
    this.inputAction,
    this.focus,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassInput,
      validator: (String? text) => validator(text),
      keyboardType: keyBoardType,
      textInputAction: inputAction,
      focusNode: focus,
      onFieldSubmitted: (String text) {
        if (!(nextFocus == null)) Focus.of(context).requestFocus(nextFocus);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16, height: 2),
      ),
    );
  }
}
