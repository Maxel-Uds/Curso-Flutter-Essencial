import 'package:cars_project/pages/login_page.dart';
import 'package:cars_project/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {

  String name;
  String email;

  DrawerList(this.name, this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/78319246?s=96&v=4)"),
              ),
              accountName: Text(name),
              accountEmail: Text(email),
            ),
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

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    return push(context, const LoginPage(), replace: true);
  }
}
