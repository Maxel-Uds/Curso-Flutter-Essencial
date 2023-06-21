import 'dart:async';

import 'package:cars_project/api/login_api.dart';
import 'package:cars_project/model/login_response.dart';
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
  final _streamController = StreamController<bool>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    LoginResponse.get().then((user) {
      if(user.id != null) push(context, const HomePage(), replace: true);
    });
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
            StreamBuilder<bool>(
              initialData: false,
              stream: _streamController.stream,
              builder: (context, snapshot) {
                return AppButton(label: "Entrar", onPressed: () => _onClickLogin(), showProgress: snapshot.data!,);
              }
            )
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

    _streamController.add(true);

    _timer = Timer(const Duration(seconds: 3), () {
      LoginApi.login(_controllerPass.text, _controllerLogin.text)
          .then((response) {
              if(response.ok) {
                    print(response.result);
                    push(context, const HomePage(), replace: true);
              } else {
                    alert(context, response.msg);
              }

              _streamController.add(false);
          });
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
