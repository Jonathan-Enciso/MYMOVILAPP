import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/services/closingShift/api_manager.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class ClosingShiftDetailPage extends StatefulWidget {
  const ClosingShiftDetailPage({this.code});

  final String code;
  @override
  _ClosingShiftDetailPageState createState() => _ClosingShiftDetailPageState();
}

class _ClosingShiftDetailPageState extends State<ClosingShiftDetailPage> {
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
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: SvgPicture.asset('assets/icons/verifyVehicle.svg',
                        width: SizeConfig.screenWidth * 0.5, color: c3)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Divider(
                      height: 4,
                      color: c2,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(' Vehículo: ' + widget.code,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: c2,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenWidth * 0.035))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Divider(
                      height: 4,
                      color: c2,
                    )),
              ],
            ),
            IconButton(
                iconSize: 100,
                icon: SvgPicture.asset(
                  'assets/icons/confirmPresentation.svg',
                ),
                onPressed: () => {
                      requestLocationPermission(
                          SizeConfig.screenWidth, widget.code, context)
                    }),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child:
                    SvgPicture.asset('assets/icons/sheetGreen.svg', width: 30))
          ],
        )));
  }
}

void getLocation(var size, String codevehicle, BuildContext context) async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  taskConfirm(
      position.latitude, position.longitude, codevehicle, size, context);
}

Future<void> requestLocationPermission(
    var size, String codevehicle, BuildContext context) async {
  final status = await Permission.locationWhenInUse.request();
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  final geolocationStatus = await geolocator.isLocationServiceEnabled();

  if (geolocationStatus) {
    if (status == PermissionStatus.granted) {
      getLocation(size, codevehicle, context);
    } else if (status == PermissionStatus.denied) {
      Fluttertoast.showToast(
          msg: "MyMóvil necesita tu ubicación para gestionar esta operación.",
          backgroundColor: c6,
          textColor: c8,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    } else if (status == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(
          msg: "MyMóvil necesita tu ubicación para gestionar esta operación.",
          backgroundColor: c6,
          textColor: c8,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
      await openAppSettings();
    } else {
      Fluttertoast.showToast(
          msg:
              "MyMóvil necesita tu ubicación para gestionar esta operación por favor activa tu ubicación.",
          backgroundColor: c6,
          textColor: c8,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);

      await openAppSettings();
    }
  } else {
    Fluttertoast.showToast(
        msg: "Por favor Activa tu ubicación.",
        backgroundColor: c6,
        textColor: c8,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);

    await AppSettings.openLocationSettings();
  }
}
