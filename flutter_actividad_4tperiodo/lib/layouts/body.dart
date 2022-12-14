import 'dart:io';

import 'package:flip_board/flip_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_actividad_4tperiodo/json/data.dart';
import 'package:flutter_actividad_4tperiodo/layouts/description.dart';
import 'package:page_transition/page_transition.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

String path = gallery[1]['img'];
String desc = gallery[1]['descripcion'];

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    debugPrint("longitud: $gallery");
    debugPrint("path: $path");
    debugPrint("Description: $desc");
    return Column(
      children: [
        gallery.length > 1
            ? Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.8),
                  ),
                  itemCount: gallery.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Descripcion(
                                    des: index,
                                  ),
                                  type:
                                      PageTransitionType.leftToRightWithFade));
                        },
                        child: Container(
                          child: FlipMatrixBoardSingleChild.assetImage(
                              imageName: gallery[index]['img'],
                              axis: Axis.vertical,
                              width: 175,
                              height: 200,
                              columnCount: 5,
                              rowCount: 5),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }
}
