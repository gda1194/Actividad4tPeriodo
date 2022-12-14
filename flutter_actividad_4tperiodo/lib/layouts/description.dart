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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(236, 65, 201, 211),
      ),
      body: contenedor(context),
    );
  }

  Container contenedor(BuildContext context) {
    return Container(
      // add a black background to prevent flickering on Android when the page flips
      color: Colors.black,
      child: PageFlipBuilder(
        flipAxis: Axis.horizontal,
        frontBuilder: (_) => imagen("frond"),
        backBuilder: (_) => imagen("back"),
        onFlipComplete: (isFrontSide) => ({newIndex(isFrontSide)}),
      ),
    );
  }

  Container imagen(String direccion) {
    int index = indexFrond;
    flagFip = "frond";
    print("frond");
    return Container(
      child: PageFlipBuilder(
        flipAxis: Axis.vertical,
        frontBuilder: (_) => Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFECEF),
            image: DecorationImage(
                image: AssetImage(
                    gallery[direccion == 'frond' ? indexFrond : indexBack]
                        ['img']),
                fit: BoxFit.cover),
          ),
        ),
        backBuilder: (_) => Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          gallery[direccion == 'frond' ? indexFrond : indexBack]
                              ['img'],
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text("Descripci??n: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(                  gallery[direccion == 'frond' ? indexFrond : indexBack]
                      ['descripcion'],
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
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
