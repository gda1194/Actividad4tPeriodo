import 'dart:ffi';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_actividad_4tperiodo/json/data.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class Descripcion extends StatefulWidget {
  final dynamic des;

  Descripcion({Key? key, this.des}) : super(key: key);

  @override
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  int index = -1;
  bool isFlagUpdate = false;
  String flagDireccion = "izq";
  bool isflagDireccion = true;
  @override
  Widget build(BuildContext context) {
    print("widget.des[index]" + widget.des.toString());
    index = widget.des;
    return Container(
      child: contenedor(context),
    );
  }

  Container contenedor(BuildContext context) {
    return Container(
      // add a black background to prevent flickering on Android when the page flips
      color: Colors.black,
      child: PageFlipBuilder(
        flipAxis: Axis.horizontal,
        frontBuilder: (_) => imagen("izq"),
        backBuilder: (_) => imagen("der"),
        onFlipComplete: (isFrontSide) => ({}),
      ),
    );
  }

  Container imagen(String direccion) {
    flagDireccion = direccion;
    int index = flipIndex(direccion);
    print("reload container " + direccion);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFECEF),
        image: DecorationImage(
            image: AssetImage(gallery[index]['img']), fit: BoxFit.cover),
      ),
    );
  }

  Container descripcion() {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
        gallery[index]['descripcion'],
        style: TextStyle(fontSize: 25),
      )),
    );
  }

  int newIndex(bool complete) {
    // print('isFrontSide: $complete');
    if (complete != isFlagUpdate) {
      // print("Transicion completa " + flagDireccion);
      isFlagUpdate = complete;
      if (flagDireccion == 'izq') {
        this.index = this.index - 1;
      } else {
        this.index = this.index + 1;
      }
    }

    // print("index " + index.toString());
    return 1;
  }

  int flipIndex(String direccion) {
    int index = this.index;
    if (isFlagUpdate) {
      if (direccion == "izq") {
        index = index - 1;
      } else {
        index = index + 1;
      }
    } else {
      isFlagUpdate = true;
    }
    return index;
  }
}
