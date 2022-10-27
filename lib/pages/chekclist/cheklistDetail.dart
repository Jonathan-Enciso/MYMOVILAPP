import 'dart:convert';
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_painter/image_painter.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/models/EBResponseGeneral.dart';
import 'package:mymovilapp/models/EbCheckListItems.dart';
import 'package:mymovilapp/widgets/alerts/SuccessProcess.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CheckListDetailPage extends StatefulWidget {
  const CheckListDetailPage({this.codeV, this.codeO});

  final String codeV;
  final String codeO;
  @override
  State<CheckListDetailPage> createState() => _CheckListDetailPageState();
}

final _imageKey1 = GlobalKey<ImagePainterState>();
final _imageKey2 = GlobalKey<ImagePainterState>();
final _imageKey3 = GlobalKey<ImagePainterState>();
final _imageKey4 = GlobalKey<ImagePainterState>();
var fullPath1;
var fullPath2;
var fullPath3;
var fullPath4;
Timer timer;

class _CheckListDetailPageState extends State<CheckListDetailPage> {
  @override
  initState() {
    super.initState();
    fullPath1 = null;
    fullPath2 = null;
    fullPath3 = null;
    fullPath4 = null;
  }

  void saveImage1() async {
    try {
      final image = await _imageKey1.currentState.exportImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      await Directory('$directory/sample').create(recursive: true);
      fullPath1 =
          '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
      final imgFile = File('$fullPath1');
      imgFile.writeAsBytesSync(image);
      setState(() {
        Navigator.of(context).pop();
      });
    } catch (e, s) {
      print('Failed to write into $fullPath1: $e\nStacktrace: $s');
    }
  }

  void saveImage2() async {
    try {
      final image = await _imageKey2.currentState.exportImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      await Directory('$directory/sample').create(recursive: true);
      fullPath2 =
          '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
      final imgFile = File('$fullPath2');
      imgFile.writeAsBytesSync(image);
      setState(() {
        Navigator.of(context).pop();
      });
    } catch (e, s) {
      print('Failed to write into $fullPath2: $e\nStacktrace: $s');
    }
  }

  void saveImage3() async {
    try {
      final image = await _imageKey3.currentState.exportImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      await Directory('$directory/sample').create(recursive: true);
      fullPath3 =
          '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
      final imgFile = File('$fullPath3');
      imgFile.writeAsBytesSync(image);
      setState(() {
        Navigator.of(context).pop();
      });
    } catch (e, s) {
      print('Failed to write into $fullPath3: $e\nStacktrace: $s');
    }
  }

  void saveImage4() async {
    try {
      final image = await _imageKey4.currentState.exportImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      await Directory('$directory/sample').create(recursive: true);
      fullPath4 =
          '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
      final imgFile = File('$fullPath4');
      imgFile.writeAsBytesSync(image);
      setState(() {
        Navigator.of(context).pop();
      });
    } catch (e, s) {
      print('Failed to write into $fullPath4: $e\nStacktrace: $s');
    }
  }

  void cleanImage1() async {
    setState(() {
      fullPath1 = null;
    });
  }

  void cleanImage2() async {
    setState(() {
      fullPath2 = null;
    });
  }

  void cleanImage3() async {
    setState(() {
      fullPath3 = null;
    });
  }

  void cleanImage4() async {
    setState(() {
      fullPath4 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Text('Lista de chequeo')),
            Row(
              children: [
                Column(children: [
                  Text(
                    'Vehiculo:',
                    style: TextStyle(fontSize: SizeConfig.screenWidth * 0.04),
                  ),
                  SvgPicture.asset(
                    'assets/icons/busGreenMovil.svg',
                    width: SizeConfig.screenWidth * 0.2,
                  )
                ]),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Text(
                      widget.codeV,
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.08,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            const Text(
              'Verifica las condiciones del vehículo asignado \n registrando las fallas presentadas.',
              style: TextStyle(
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            )
          ]),
          titleSpacing: 00.0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          toolbarHeight: SizeConfig.screenHeight * 0.25,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 0.00,
          backgroundColor: c1,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c5,
                    ),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.1,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: c6),
                                  width: SizeConfig.screenHeight * 0.06,
                                  height: SizeConfig.screenHeight * 0.06,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                          'assets/icons/mechanicalFailure.svg')))),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Falla mecánica',
                                    style: TextStyle(
                                        color: c2,
                                        fontSize:
                                            SizeConfig.screenWidth * 0.05),
                                  ),
                                  Text('(No prende, Aceleración)',
                                      style: TextStyle(
                                          color: c2,
                                          fontSize:
                                              SizeConfig.screenHeight * 0.01)),
                                ],
                              )),
                          Switch(
                            value: co1,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                co1 = newValue;
                              });
                            },
                          )
                        ]))),
            co1
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c6,
                            spreadRadius: 1,
                          ),
                        ],
                      ), //             <--- BoxDecoration here
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Aceleración',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    value: cf2,
                                    activeColor: c1,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf2 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Dirección',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf4,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf4 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Puertas',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf5,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf5 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Plataforma',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf6,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf6 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //    SizedBox(
                              //      width: SizeConfig.screenWidth * 0.20,
                              //      child: Text(
                              //        ' No prende',
                              //        style: TextStyle(
                              //          color: c2,
                              //          fontSize: 10,
                              //        ),
                              //      ),
                              //    ),
                              //    SizedBox(
                              //        width: SizeConfig.screenWidth * 0.20,
                              //        child: Checkbox(
                              //          activeColor: c1,
                              //          value: cf1,
                              //          onChanged: (pruebas) {
                              //            setState(() {
                              //              cf1 = pruebas;
                              //            });
                              //         },
                              //       )),
                              Container(
                                width: SizeConfig.screenWidth * 0.20,
                              ),
                              Container(
                                width: SizeConfig.screenWidth * 0.20,
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                : Container(),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c5,
                    ),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.1,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: c6),
                                  width: SizeConfig.screenHeight * 0.06,
                                  height: SizeConfig.screenHeight * 0.06,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                          'assets/icons/sirci-its.svg')))),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'SIRCI-ITS',
                                    style: TextStyle(
                                        color: c2,
                                        fontSize:
                                            SizeConfig.screenWidth * 0.05),
                                  ),
                                  Text('(Unidad lógica, rutero)',
                                      style: TextStyle(
                                          color: c2,
                                          fontSize:
                                              SizeConfig.screenHeight * 0.01)),
                                ],
                              )),
                          Switch(
                            value: co2,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                co2 = newValue;
                              });
                            },
                          )
                        ]))),
            co2
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c6,
                            spreadRadius: 1,
                          ),
                        ],
                      ), //             <--- BoxDecoration here
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Unidad Lógica No Enciende',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf3,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf3 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Validador No Enciende',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf7,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf7 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Rutero',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf8,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf8 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Existencia De Cámaras',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf9,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf9 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          )
                        ],
                      ),
                    ))
                : Container(),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c5,
                    ),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.1,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: c6),
                                  width: SizeConfig.screenHeight * 0.06,
                                  height: SizeConfig.screenHeight * 0.06,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                          'assets/icons/documents.svg')))),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Documentos',
                                    style: TextStyle(
                                        color: c2,
                                        fontSize:
                                            SizeConfig.screenWidth * 0.05),
                                  ),
                                  Text('(SOAT, Tarjeta de propiedad)',
                                      style: TextStyle(
                                          color: c2,
                                          fontSize:
                                              SizeConfig.screenHeight * 0.01)),
                                ],
                              )),
                          Switch(
                            value: co3,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                co3 = newValue;
                              });
                            },
                          )
                        ]))),
            co3
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c6,
                            spreadRadius: 1,
                          ),
                        ],
                      ), //             <--- BoxDecoration here
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Seguro Extracontractual',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf10,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf10 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Tarjeta De Vinculación',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf13,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf13 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Tarjeta De Propiedad',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf12,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf12 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Seguro Obligatorio ',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf11,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf11 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          )
                        ],
                      ),
                    ))
                : Container(),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c5,
                    ),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.1,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: c6),
                                  width: SizeConfig.screenHeight * 0.06,
                                  height: SizeConfig.screenHeight * 0.06,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                          'assets/icons/bodywork.svg')))),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Carrocería',
                                    style: TextStyle(
                                        color: c2,
                                        fontSize:
                                            SizeConfig.screenWidth * 0.05),
                                  ),
                                  Text('(Luces, Vidrios)',
                                      style: TextStyle(
                                          color: c2,
                                          fontSize:
                                              SizeConfig.screenHeight * 0.01)),
                                ],
                              )),
                          Switch(
                            value: co4,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                co4 = newValue;
                              });
                            },
                          )
                        ]))),
            co4
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c6,
                            spreadRadius: 1,
                          ),
                        ],
                      ), //             <--- BoxDecoration here
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Luces',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf14,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf14 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Desempañante Y/O Limpiaparabrisas',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf15,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf15 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.20,
                                child: Text(
                                  ' Silla Operador',
                                  style: TextStyle(
                                    color: c2,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf16,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf16 = pruebas;
                                      });
                                    },
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Text(
                                    ' Vidrios Y/O Espejos',
                                    style: TextStyle(
                                      color: c2,
                                      fontSize: 10,
                                    ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.screenWidth * 0.20,
                                  child: Checkbox(
                                    activeColor: c1,
                                    value: cf17,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        cf17 = pruebas;
                                      });
                                    },
                                  ))
                            ],
                          )
                        ],
                      ),
                    ))
                : Container(),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c5,
                    ),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.1,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: c6),
                                  width: SizeConfig.screenHeight * 0.06,
                                  height: SizeConfig.screenHeight * 0.06,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                          'assets/icons/add.svg')))),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Daños adicionales',
                                    style: TextStyle(
                                        color: c2,
                                        fontSize:
                                            SizeConfig.screenWidth * 0.05),
                                  ),
                                ],
                              )),
                          Switch(
                            value: co5,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                co5 = newValue;
                              });
                            },
                          )
                        ]))),
            co5
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: c6,
                            spreadRadius: 1,
                          ),
                        ],
                      ), //             <--- BoxDecoration here
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            maxLength: 200,
                            onChanged: (text) {
                              txtObs = text;
                            },
                          )
                        ],
                      ),
                    ))
                : Container(),
            Center(
                child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      thickness: 1,
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: Text(
                      ' Seleccionar Daños',
                      style: TextStyle(
                        color: c2,
                        fontSize: 15,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: Container(
                            width: SizeConfig.screenWidth * 0.20,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: c3),
                              borderRadius:
                                  BorderRadius.circular(20), //<-- SEE HERE
                            ),
                            child: fullPath1 == null
                                ? Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Derecho',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      IconButton(
                                          icon: Image.asset(
                                              'assets/images/P1.png'),
                                          iconSize: 50,
                                          onPressed: () async => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Column(children: [
                                                    new AlertDialog(
                                                      content: ImagePainter.asset(
                                                          "assets/images/P1.png",
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          key: _imageKey1,
                                                          scalable: false),
                                                    ),
                                                    new RaisedButton(
                                                      onPressed: () async {
                                                        saveImage1();
                                                      },
                                                      child:
                                                          new Text('Guardar'),
                                                    )
                                                  ]);
                                                },
                                              ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Derecho',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      SvgPicture.asset(
                                          'assets/icons/confirmation.svg',
                                          width: 50),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: c3,
                                          ),
                                          iconSize: 50,
                                          onPressed: () async =>
                                              {cleanImage1()})
                                    ],
                                  ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: Container(
                            width: SizeConfig.screenWidth * 0.20,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: c3),
                              borderRadius:
                                  BorderRadius.circular(20), //<-- SEE HERE
                            ),
                            child: fullPath2 == null
                                ? Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Frente',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      IconButton(
                                          icon: Image.asset(
                                              'assets/images/P2.png'),
                                          iconSize: 50,
                                          onPressed: () async => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Column(children: [
                                                    new AlertDialog(
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      content: ImagePainter.asset(
                                                          "assets/images/P2.png",
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          key: _imageKey2,
                                                          scalable: false),
                                                    ),
                                                    new RaisedButton(
                                                      onPressed: () async {
                                                        saveImage2();
                                                      },
                                                      child:
                                                          new Text('Guardar'),
                                                    )
                                                  ]);
                                                },
                                              ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Frente',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      SvgPicture.asset(
                                          'assets/icons/confirmation.svg',
                                          width: 50),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: c3,
                                          ),
                                          iconSize: 50,
                                          onPressed: () async =>
                                              {cleanImage2()})
                                    ],
                                  ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: Container(
                            width: SizeConfig.screenWidth * 0.20,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: c3),
                              borderRadius:
                                  BorderRadius.circular(20), //<-- SEE HERE
                            ),
                            child: fullPath3 == null
                                ? Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Izquierdo',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      IconButton(
                                          icon: Image.asset(
                                              'assets/images/P3.png'),
                                          iconSize: 50,
                                          onPressed: () async => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Column(children: [
                                                    new AlertDialog(
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      content: ImagePainter.asset(
                                                          "assets/images/P3.png",
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          key: _imageKey3,
                                                          scalable: false),
                                                    ),
                                                    new RaisedButton(
                                                      onPressed: () async {
                                                        saveImage3();
                                                      },
                                                      child:
                                                          new Text('Guardar'),
                                                    )
                                                  ]);
                                                },
                                              ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Derecho',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      SvgPicture.asset(
                                          'assets/icons/confirmation.svg',
                                          width: 50),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: c3,
                                          ),
                                          iconSize: 50,
                                          onPressed: () async =>
                                              {cleanImage3()})
                                    ],
                                  ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: Container(
                            width: SizeConfig.screenWidth * 0.20,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: c3),
                              borderRadius:
                                  BorderRadius.circular(20), //<-- SEE HERE
                            ),
                            child: fullPath4 == null
                                ? Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Posterior',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      IconButton(
                                          icon: Image.asset(
                                              'assets/images/P4.png'),
                                          iconSize: 50,
                                          onPressed: () async => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Column(children: [
                                                    new AlertDialog(
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      content: ImagePainter.asset(
                                                          "assets/images/P4.png",
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          key: _imageKey4,
                                                          scalable: false),
                                                    ),
                                                    new RaisedButton(
                                                      onPressed: () async {
                                                        saveImage4();
                                                      },
                                                      child:
                                                          new Text('Guardar'),
                                                    )
                                                  ]);
                                                },
                                              ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        'Posterior',
                                        style: TextStyle(color: c2),
                                        textAlign: TextAlign.center,
                                      )),
                                      SvgPicture.asset(
                                          'assets/icons/confirmation.svg',
                                          width: 50),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: c3,
                                          ),
                                          iconSize: 50,
                                          onPressed: () async =>
                                              {cleanImage4()})
                                    ],
                                  ))),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      thickness: 1,
                    )),
                IconButton(
                  iconSize: 100,
                  icon: SvgPicture.asset(
                    'assets/icons/buttonCheckList.svg',
                  ),
                  onPressed: () {
                    _submit(widget.codeO, widget.codeV);
                  },
                ),
                Text(
                  'Vehículo verificado',
                  style: TextStyle(color: c1),
                ),
              ],
            )),
          ],
        )));
  }

  _submit(var codeO, var codeV) async {
    String jsonComponents = getChecklist(codeO, codeV);
    var headers = {
      'Authorization': 'bearer ' + token,
      'Content-Type': 'application/json'
    };

    var request = http.Request('POST', Uri.parse(checkListPost));
    request.body = jsonComponents;
    request.headers.addAll(headers);
    request.followRedirects = false;

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var setList = await response.stream.bytesToString();
      EbResponseGeneral obj = ebResponseGeneralFromJson(setList.toString());
      if (obj.valid) {
        showDialog(
          context: context,
          builder: (context) {
            timer = Timer(Duration(seconds: 2), () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "menu");
            });
            return successProcessAlert(obj.message);
          },
        );
        if (fullPath1 != null ||
            fullPath2 != null ||
            fullPath3 != null ||
            fullPath4 != null) {
          var headers = {'Authorization': 'bearer ' + token};
          var request =
              http.MultipartRequest('POST', Uri.parse(checkListImagePost));
          request.fields.addAll(
              {'codigo_operador': codeO, 'id_chk': obj.idData.toString()});

          if (fullPath1 != null) {
            request.files
                .add(await http.MultipartFile.fromPath('files', fullPath1));
          }
          if (fullPath2 != null) {
            request.files
                .add(await http.MultipartFile.fromPath('files', fullPath2));
          }
          if (fullPath3 != null) {
            request.files
                .add(await http.MultipartFile.fromPath('files', fullPath3));
          }

          if (fullPath4 != null) {
            request.files
                .add(await http.MultipartFile.fromPath('files', fullPath4));
          }

          request.headers.addAll(headers);
          request.followRedirects = false;

          http.StreamedResponse response = await request.send();

          if (response.statusCode == 200) {
            print(await response.stream.bytesToString());
          } else {
            print(response.reasonPhrase);
          }
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
          headerAnimationLoop: false,
          animType: AnimType.BOTTOMSLIDE,
          btnOkText: 'Cerrar',
          showCloseIcon: true,
          body: Column(
            children: <Widget>[
              Text(
                obj.message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )..show();
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  String getChecklist(var codeO, var codeV) {
    EbCheckListItems matches = EbCheckListItems();
    List<CheckUpFail> menu = <CheckUpFail>[];
    matches.employee = codeO;
    matches.username = codeO;
    matches.vehicle = codeV;
    if (co1) {
      if (cf1) {
        menu.add(CheckUpFail(
            idComponent: 1,
            idComponentFails: 1,
            status: false,
            description: ''));
      }
      if (cf2) {
        menu.add(CheckUpFail(
            idComponent: 1,
            idComponentFails: 2,
            status: false,
            description: ''));
      }
      if (cf4) {
        menu.add(CheckUpFail(
            idComponent: 1,
            idComponentFails: 4,
            status: false,
            description: ''));
      }
      if (cf5) {
        menu.add(CheckUpFail(
            idComponent: 1,
            idComponentFails: 5,
            status: false,
            description: ''));
      }
      if (cf6) {
        menu.add(CheckUpFail(
            idComponent: 1,
            idComponentFails: 6,
            status: false,
            description: ''));
      }
    } else {
      menu.add(CheckUpFail(idComponent: 1, status: true, description: ''));
    }
    if (co2) {
      if (cf3) {
        menu.add(CheckUpFail(
            idComponent: 2,
            idComponentFails: 3,
            status: false,
            description: ''));
      }
      if (cf7) {
        menu.add(CheckUpFail(
            idComponent: 2,
            idComponentFails: 7,
            status: false,
            description: ''));
      }
      if (cf8) {
        menu.add(CheckUpFail(
            idComponent: 2,
            idComponentFails: 8,
            status: false,
            description: ''));
      }
      if (cf9) {
        menu.add(CheckUpFail(
            idComponent: 2,
            idComponentFails: 9,
            status: false,
            description: ''));
      }
    } else {
      menu.add(CheckUpFail(idComponent: 2, status: true, description: ''));
    }

    if (co3) {
      if (cf10) {
        menu.add(CheckUpFail(
            idComponent: 3,
            idComponentFails: 10,
            status: false,
            description: ''));
      }
      if (cf11) {
        menu.add(CheckUpFail(
            idComponent: 3,
            idComponentFails: 11,
            status: false,
            description: ''));
      }
      if (cf12) {
        menu.add(CheckUpFail(
            idComponent: 3,
            idComponentFails: 12,
            status: false,
            description: ''));
      }
      if (cf13) {
        menu.add(CheckUpFail(
            idComponent: 3,
            idComponentFails: 13,
            status: false,
            description: ''));
      }
    } else {
      menu.add(CheckUpFail(idComponent: 3, status: true, description: ''));
    }

    if (co4) {
      if (cf14) {
        menu.add(CheckUpFail(
            idComponent: 4,
            idComponentFails: 14,
            status: false,
            description: ''));
      }
      if (cf15) {
        menu.add(CheckUpFail(
            idComponent: 4,
            idComponentFails: 15,
            status: false,
            description: ''));
      }
      if (cf16) {
        menu.add(CheckUpFail(
            idComponent: 4,
            idComponentFails: 16,
            status: false,
            description: ''));
      }
      if (cf17) {
        menu.add(CheckUpFail(
            idComponent: 4,
            idComponentFails: 17,
            status: false,
            description: ''));
      }
    } else {
      menu.add(CheckUpFail(idComponent: 4, status: true, description: ''));
    }

    if (co5) {
      menu.add(CheckUpFail(
          idComponent: 5,
          idComponentFails: 18,
          status: false,
          description: txtObs));
    } else {
      menu.add(CheckUpFail(idComponent: 5, status: true, description: ''));
    }
    matches.checkUpFails = menu;
    return json.encode(matches.toJson());
  }

  String txtObs = "";
  bool co1 = false;
  bool co2 = false;
  bool co3 = false;
  bool co4 = false;
  bool co5 = false;

  bool cf1 = false;
  bool cf2 = false;
  bool cf3 = false;
  bool cf4 = false;
  bool cf5 = false;
  bool cf6 = false;
  bool cf7 = false;
  bool cf8 = false;
  bool cf9 = false;
  bool cf10 = false;
  bool cf11 = false;
  bool cf12 = false;
  bool cf13 = false;
  bool cf14 = false;
  bool cf15 = false;
  bool cf16 = false;
  bool cf17 = false;
  bool cf18 = false;
}
