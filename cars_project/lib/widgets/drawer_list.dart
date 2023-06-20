import 'package:cars_project/api/constants/constants.dart';
import 'package:cars_project/model/login_response.dart';
import 'package:cars_project/pages/login_page.dart';
import 'package:cars_project/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {

  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            FutureBuilder<LoginResponse>(
              future: LoginResponse.get(),
              builder: (context, snapshot) {
              return snapshot.hasData ? _header(snapshot.data!.name, "maxellopes32@gmail.com", snapshot.data!.id) : Container();
            }),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              subtitle: const Text("Sair"),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header(String name, String email, int id) {
    return UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(Constants.getSpriteUrl(id.toString())), backgroundColor: Colors.white,),
            accountName: Text(name),
            accountEmail: Text(email),
          );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    return push(context, const LoginPage(), replace: true);
  }
}
