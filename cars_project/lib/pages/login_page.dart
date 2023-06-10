import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          _textFormField("Login", "Digite o login"),
          const SizedBox(height: 10),
          _textFormField("Senha", "Digite a senha", isPassInput: true),
          const SizedBox(height: 20),
          _button("Entrar")
        ],
      ),
    );
  }

  _button(String label) {
    return SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              label,
              style: const TextStyle(fontSize: 22),
            ),
          ),
        );
  }

  _textFormField(String label, String hint, { bool isPassInput = false }) {
    return TextFormField(
          obscureText: isPassInput,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 16, height: 2),
          ),
        );
  }
}
