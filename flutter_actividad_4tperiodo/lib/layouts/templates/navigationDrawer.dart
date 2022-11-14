import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
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
