import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/data/style.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';
import 'package:mymovilapp/session/user.dart';

import 'package:permission_handler/permission_handler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _scanBarcode = 'Unknown';
  bool isLoading = true;
  String usecomuse = '';

  String usecompas = '';

  fin() async {
    await Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  _onnull() {
    return null;
  }

  Future<void> scanQR(var size) async {
    String barcodeScanRes;
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#004D40', 'Cancelar', true, ScanMode.QR);
    if (!mounted) {
      return;
    }
    setState(() {
      _scanBarcode = barcodeScanRes;
      if (_scanBarcode == '-1') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return errorProcessAlert('Código no identificado');
          },
        );
      } else {
        findUser(_scanBarcode, true, 3, 'pass', size, context);
      }
    });
  }

  bool enabled = false;
  _onTapped() async {
    setState(() {
      enabled = true;
    });
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
        fin();
        enabled = false;
      });
    });
  }

  Future<void> checkpermissionopencamera(var size) async {
    var status = await Permission.camera.status;

    if (!status.isGranted) await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      scanQR(size);
    } else if (status == PermissionStatus.denied) {
      Fluttertoast.showToast(
          msg:
              "MyMóvil necesita acceder a tu cámara para realizar esta operación .",
          backgroundColor: c6,
          textColor: c8,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    } else if (status == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(
          msg:
              "MyMóvil necesita acceder a tu cámara para realizar esta operación. ",
          backgroundColor: c6,
          textColor: c8,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/back.svg',
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            toolbarHeight: 130,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: Customshape(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: c1,
                child: Center(
                    child: SvgPicture.asset('assets/images/Logo.svg',
                        width: SizeConfig.screenWidth * 0.35)),
              ),
            )),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                    child: Text('Bienvenido/a',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: c1,
                            fontSize: SizeConfig.screenWidth * 0.06,
                            fontWeight: FontWeight.bold))),
                Text(
                  'Inicia sesión con tu numero \n de cedula y año de nacimiento. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: c2, fontSize: SizeConfig.screenWidth * 0.030),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: c2)),
                      child: TextField(
                        onChanged: (text) {
                          usecomuse = text;
                        },
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: SvgPicture.asset(
                              'assets/icons/user.svg',
                              height: SizeConfig.screenHeight * 0.005,
                            ),
                          ),
                          labelText: "Numero de identificación",
                          labelStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: c2)),
                      child: TextField(
                        onChanged: (text) {
                          usecompas = text;
                        },
                        obscureText: true,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          prefixIcon: Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: SvgPicture.asset(
                              'assets/icons/pass.svg',
                              height: SizeConfig.screenHeight * 0.005,
                            ),
                          ),
                          labelText: "Contraseña",
                          labelStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 40, 10),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Recordar Contraseña',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: c1,
                              fontSize: SizeConfig.screenWidth * 0.03,
                              fontWeight: FontWeight.bold),
                        ))),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/qr.svg',
                    height: SizeConfig.screenHeight * 0.6,
                  ),
                  onPressed: () {
                    checkpermissionopencamera(SizeConfig.screenWidth);
                  },
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                    child: ElevatedButton(
                      style: sButton,
                      onPressed: () => {
                        setState(() {
                          isLoading = false;
                          enabled
                              ? _onnull()
                              : findUser(usecomuse, false, 3, usecompas,
                                  SizeConfig.screenWidth, context);
                          _onTapped();
                        })
                      },
                      child: Text('Ingresar', style: sTextButton),
                    )),
              ],
            )
          ],
        )));
  }
}
