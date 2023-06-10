import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();

  LoginPage({super.key});

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
          _textFormField("Login", "Digite o login",
              controller: _controllerLogin),
          const SizedBox(height: 10),
          _textFormField("Senha", "Digite a senha",
              controller: _controllerPass, isPassInput: true),
          const SizedBox(height: 20),
          _button("Entrar", () => _onClickLogin())
        ],
      ),
    );
  }

  _button(String label, Function onPressed) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  _textFormField(String label, String hint,
      {bool isPassInput = false, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassInput,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16, height: 2),
      ),
    );
  }

  _onClickLogin() {
    String login = _controllerLogin.text;
    String pass = _controllerPass.text;

    print("Login $login");
    print("Pass $pass");
  }
}
