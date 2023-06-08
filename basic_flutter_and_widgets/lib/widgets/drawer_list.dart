import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/78319246?s=96&v=4)"),
              ),
              accountName: Text("Maxel Udson"),
              accountEmail: Text("maxellopes32@gmail.com"),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favoritos"),
              subtitle: const Text("Cães favoritos"),
              trailing: const Icon(Icons.start),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Ajuda"),
              subtitle: const Text("Suporte"),
              trailing: const Icon(Icons.start),
              onTap: () {
                print("Ajuda");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
