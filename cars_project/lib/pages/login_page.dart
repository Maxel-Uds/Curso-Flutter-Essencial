import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _textFormField("Login", "Digite o login", controller: _controllerLogin, validator: _validateLogin),
            const SizedBox(height: 10),
            _textFormField("Senha", "Digite a senha", controller: _controllerPass, isPassInput: true, validator: _validatePass),
            const SizedBox(height: 20),
            _button("Entrar", () => _onClickLogin())
          ],
        ),
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

  _textFormField(String label, String hint, {bool isPassInput = false, required TextEditingController controller, required FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassInput,
      validator: (String? text) => validator(text),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16, height: 2),
      ),
    );
  }

  String? _validateLogin(String? login) {
      return login!.isEmpty ? "Digite o login" : null;
  }

  String? _validatePass(String? pass) {
    if(pass!.isEmpty) {
      return "Digite a senha";
    }

    if(pass.length < 3) {
      return "A senha deve ter no mínimo 3 caracteres";
    }

    return null;
  }

  _onClickLogin() {
    if(_formKey.currentState!.validate()) {
      return;
    }

    String login = _controllerLogin.text;
    String pass = _controllerPass.text;

    print("Login $login");
    print("Pass $pass");
  }
}
