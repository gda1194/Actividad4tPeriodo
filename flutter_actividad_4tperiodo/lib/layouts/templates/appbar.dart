import 'package:flutter/material.dart';

PreferredSizeWidget header() {
  return PreferredSize(
      child: AppBar(
      backgroundColor: Color.fromARGB(236, 65, 201, 211),
        title: Text("Menú Principal"),
      ),
      preferredSize: Size.fromHeight(50));
}
