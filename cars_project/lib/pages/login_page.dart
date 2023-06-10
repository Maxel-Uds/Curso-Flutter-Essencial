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
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
              hintText: "Digite o login",
              hintStyle: TextStyle(fontSize: 16, height: 2),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
              hintText: "Digite a senha",
              hintStyle: TextStyle(fontSize: 16, height: 2),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Entrar",
                style: TextStyle(fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
