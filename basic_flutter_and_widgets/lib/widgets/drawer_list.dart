import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
    );
  }
}
