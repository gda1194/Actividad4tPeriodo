
import 'package:flutter/material.dart';
import 'package:flutter_actividad_4tperiodo/layouts/body.dart';
import 'package:flutter_actividad_4tperiodo/layouts/templates/appbar.dart';
import 'package:flutter_actividad_4tperiodo/layouts/templates/footer.dart';
import 'package:flutter_actividad_4tperiodo/layouts/templates/navigationDrawer.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      drawer: drawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar: footer(),
      body: body(),
    );
  }
}
