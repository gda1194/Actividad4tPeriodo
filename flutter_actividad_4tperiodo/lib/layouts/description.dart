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
  int indexFrond = -1;
  int indexBack = -1;

  String flagFip = "frond";

  @override
  Widget build(BuildContext context) {
    print("widget.des[index]" + widget.des.toString());
    indexFrond = widget.des;
    indexBack = widget.des + 1;
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
        frontBuilder: (_) => imagenFrond(),
        backBuilder: (_) => imagenBack(),
        onFlipComplete: (isFrontSide) => ({newIndex(isFrontSide)}),
      ),
    );
  }

  Container imagenFrond() {
    int index = indexFrond;
    flagFip = "frond";
    // print("reload container frond");
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFECEF),
        image: DecorationImage(
            image: AssetImage(gallery[indexFrond]['img']), fit: BoxFit.cover),
      ),
    );
  }

  Container imagenBack() {
    flagFip = "back";
    // print("reload container back");
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFECEF),
        image: DecorationImage(
            image: AssetImage(gallery[indexBack]['img']), fit: BoxFit.cover),
      ),
    );
  }

  Container descripcion() {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
        gallery[indexFrond]['descripcion'],
        style: TextStyle(fontSize: 25),
      )),
    );
  }

  int newIndex(bool complete) {
    // Front true
    // back false
    if (complete) {
      if (indexFrond < gallery.length - 1) {
        indexBack = indexFrond + 1;
      } else {
        indexBack = 0;
      }
    } else {
      if (indexBack < gallery.length - 1) {
        indexFrond = indexBack + 1;
      } else {
        indexFrond = 0;
      }
    }
    return 1;
  }
}
