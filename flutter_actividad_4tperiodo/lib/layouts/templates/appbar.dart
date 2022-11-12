import 'package:flutter/material.dart';

PreferredSizeWidget header() {
  return PreferredSize(
      child: AppBar(
        title: Text("Menú Principal"),
      ),
      preferredSize: Size.fromHeight(50));
}
