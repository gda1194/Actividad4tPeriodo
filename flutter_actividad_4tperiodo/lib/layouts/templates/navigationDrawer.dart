import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                color: Color.fromARGB(236, 65, 201, 211),
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
          onTap: () {
            SystemNavigator.pop();
          },
        ),
      ],
    ),
  );
}
