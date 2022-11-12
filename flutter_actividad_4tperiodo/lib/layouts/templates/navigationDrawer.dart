import 'package:flutter/material.dart';

Widget drawer() {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        // ignore: prefer_const_literals_to_create_immutables
        Column(children: [
          const SizedBox(
            width: 1000,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Bienvenido:'),
            ),
          ),
        ]),
        ListTile(
          leading: Icon(
            Icons.settings,
          ),
          title: const Text('Preferencias'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
          ),
          title: const Text('Salir'),
          onTap: () {},
        ),
      ],
    ),
  );
}
