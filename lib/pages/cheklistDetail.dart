import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';

class CheckListDetailPage extends StatefulWidget {
  const CheckListDetailPage({Key key}) : super(key: key);

  @override
  State<CheckListDetailPage> createState() => _CheckListDetailPageState();
}

class _CheckListDetailPageState extends State<CheckListDetailPage> {
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
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Text(
                      'Z67-7017',
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
          toolbarHeight: 200,
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
                            value: _switchValue,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          )
                        ]))),
            _switchValue
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
                                    value: value,
                                    activeColor: c1,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                  ' No prende',
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
                                      });
                                    },
                                  )),
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
                            value: _switchValue,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          )
                        ]))),
            _switchValue
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                            value: _switchValue,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          )
                        ]))),
            _switchValue
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                            value: _switchValue,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          )
                        ]))),
            _switchValue
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                                    value: value,
                                    onChanged: (pruebas) {
                                      setState(() {
                                        value = pruebas;
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
                            value: _switchValue,
                            activeColor: c4,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveThumbColor: c1,
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          )
                        ]))),
            _switchValue
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
                IconButton(
                  iconSize: 100,
                  icon: SvgPicture.asset(
                    'assets/icons/buttonCheckList.svg',
                  ),
                  onPressed: () {},
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

  bool _switchValue = true;
  bool value = false;
}
