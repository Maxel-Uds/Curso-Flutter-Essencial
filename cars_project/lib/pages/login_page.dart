import 'package:cars_project/api/login_api.dart';
import 'package:cars_project/pages/home_page.dart';
import 'package:cars_project/utils/alert.dart';
import 'package:cars_project/utils/nav.dart';
import 'package:cars_project/widgets/app_button.dart';
import 'package:cars_project/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();
  final _focusPass = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
            AppText(
              label: "Login",
              hint: "Digite o login",
              controller: _controllerLogin,
              validator: _validateLogin,
              keyBoardType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              nextFocus: _focusPass,
            ),
            const SizedBox(height: 15),
            AppText(
              label: "Senha",
              hint: "Digite a senha",
              controller: _controllerPass,
              isPassInput: true,
              validator: _validatePass,
              keyBoardType: TextInputType.number,
              focus: _focusPass,
            ),
            const SizedBox(height: 20),
            AppButton(label: "Entrar", onPressed: () => _onClickLogin())
          ],
        ),
      ),
    );
  }

  String? _validateLogin(String? login) {
    return login!.isEmpty ? "Digite o login" : null;
  }

  String? _validatePass(String? pass) {
    if (pass!.isEmpty) {
      return "Digite a senha";
    }

    if (pass.length < 3) {
      return "A senha deve ter no mínimo 3 caracteres";
    }

    return null;
  }

  _onClickLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    LoginApi.login(_controllerPass.text, _controllerLogin.text)
        .then((response) {
          if(response.ok!) {
            print(response.result);
            push(context, const HomePage());
          } else {
            alert(context, response.msg);
          }
        });
  }
}
