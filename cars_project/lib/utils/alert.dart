import 'package:flutter/material.dart';

alert(BuildContext context, String? msg) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Flutter Project"),
          content: Text(msg!),
          actions: [
            TextButton(
                child: const Text("Ok"),
                onPressed: () => Navigator.pop(context)),
          ],
        );
      });
}