import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Descripcion extends StatefulWidget {
  final dynamic img;

  Descripcion({Key? key, this.img}) : super(key: key);

  @override
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        front: Container(child: ,),
        back: Container(),
      ),
    );
  }
}