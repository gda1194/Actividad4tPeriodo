import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Descripcion extends StatefulWidget {
  final dynamic des;

  Descripcion({Key? key, this.des}) : super(key: key);

  @override
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlipCard(
        fill: Fill.fillFront,
        direction: FlipDirection.VERTICAL,
        front: Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFECEF),
            image: DecorationImage(
                image: AssetImage(widget.des['img']), fit: BoxFit.cover),
          ),
        ),
        back: Container(
          color: Colors.white,
          child: Center(child: Text(widget.des['descripcion'], style: TextStyle(fontSize: 25),)),
        ),
      ),
    );
  }
}
