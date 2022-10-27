import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/pages/closingShift/closingShiftDetail.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class ClosingShiftPage extends StatefulWidget {
  const ClosingShiftPage();

  @override
  _ClosingShiftPageState createState() => _ClosingShiftPageState();
}

class _ClosingShiftPageState extends State<ClosingShiftPage> {
  String _scanBarcode = 'Unknown';
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
                width: SizeConfig.screenWidth,
                color: c1,
                child: const Center(
                    child: Text(
                  'Cierre Turno',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    DateFormat.yMMMMd('es').format(DateTime.now()),
                    style: TextStyle(
                        color: c2, fontSize: SizeConfig.screenWidth * 0.035),
                  )),
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/help.svg', width: 20),
                    onPressed: () {},
                  )
                ],
              ),
            ]),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(' Escanea el código QR \n del vehículo  ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: c2,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenWidth * 0.035))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: SvgPicture.asset('assets/icons/scannerBus.svg',
                        width: SizeConfig.screenWidth * 0.6))
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Divider(
                  height: 4,
                  color: c2,
                )),
            IconButton(
                iconSize: 100,
                icon: SvgPicture.asset(
                  'assets/icons/buttonCamera.svg',
                ),
                onPressed: () =>
                    {_checkpermission_opencamera(SizeConfig.screenWidth)}),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child:
                    SvgPicture.asset('assets/icons/sheetGreen.svg', width: 30))
          ],
        )));
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

      if (_scanBarcode == '1') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
              return errorProcessAlert('Código no identificado');
          },
        );
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ClosingShiftDetailPage(code: _scanBarcode)));
      }
    });
  }

  Future<void> _checkpermission_opencamera(var size) async {
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
}
