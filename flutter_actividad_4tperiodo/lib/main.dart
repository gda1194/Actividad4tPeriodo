import 'package:flutter/material.dart';

import 'layouts/principal.dart';

void main() {
  runApp(const MyApp());
  //**
  // Rojas Guido, Jonathan Orlando 25-4763-2016
  // Ayala Ayala, Gerson David 25-0900-2018
  // */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
