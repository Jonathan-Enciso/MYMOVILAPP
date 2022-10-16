import 'dart:convert';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/models/EBResponseGeneral.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/data/user.dart';
import 'package:mymovilapp/models/EBfindShiftStart.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:mymovilapp/widgets/alerts/SuccessPresentation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class ClosingShiftPage extends StatefulWidget {
  const ClosingShiftPage({Key key}) : super(key: key);

  @override
  State<ClosingShiftPage> createState() => _ClosingShiftPageState();
}

class _ClosingShiftPageState extends State<ClosingShiftPage> {
  Future<EBfindShiftStart> _value;
  @override
  initState() {
    super.initState();
    _value = getValue();
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
            Center(
                child: Text('Escanea el código QR \n del vehículo.',
                    textAlign: TextAlign.center, style: TextStyle(color: c2))),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/scannerBus.svg',
                    width: SizeConfig.screenWidth * 0.6)),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(
                  color: Colors.grey,
                  height: 10,
                )),
            Center(
              child: IconButton(
                  iconSize: 100,
                  icon: SvgPicture.asset(
                    'assets/icons/buttonCamera.svg',
                  ),
                  onPressed: () => {}),
            ),
            Text(
              'Escanear',
              style: TextStyle(color: c1),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                child: SvgPicture.asset('assets/icons/sheetGreen.svg',
                    width: SizeConfig.screenWidth * 0.06))
          ],
        )));
  }
}

Future<EBfindShiftStart> getValue() async {
  await Future.delayed(Duration(seconds: 1));
  EBfindShiftStart obj;
  try {
    var headers = {'Authorization': 'bearer ' + token};

    http.Response response =
        await http.get(Uri.encodeFull(findShiftStart + code), headers: headers);

    if (response.statusCode == 200) {
      obj = eBfindShiftStartFromJson(utf8.decode(response.bodyBytes));
      print(obj);
    }
  } on TimeoutException catch (e) {
    print('Timeout Error: $e');
  } on SocketException catch (e) {
    print('Socket Error: $e');
  } on Error catch (e) {
    print('General Error: $e');
  }
  return obj;
}

void getLocation(
    var size, int taskid, String code, BuildContext context) async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  postSerconConfirm(
      position.latitude, position.longitude, taskid, code, size, context);
}

Future<void> postSerconConfirm(double latitude, double longitude, int task,
    String code, var size, BuildContext context) async {
  var headers = {
    'Authorization': 'bearer ' + token,
    'Content-Type': 'application/json'
  };
  var body = json.encode({
    "longitude": longitude.toString(),
    "code": code,
    "latitude": latitude.toString(),
    "id_task": task
  });

  final response = await http.post(serconConfirm,
      headers: headers, body: body, encoding: Encoding.getByName("utf-8"));

  if (response.statusCode == 200) {
    final ebSerconConfirm =
        ebResponseGeneralFromJson(utf8.decode(response.bodyBytes));
    if (ebSerconConfirm.valid) {
      showDialog(
        context: context,
        builder: (context) {
          return alertSuccessPresentation;
        },
      );
      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ClosingShiftPage()));
      });
    } else {
      // dialogo error
    }
  } else {
// dialogo conexion
  }
}

Future<void> requestLocationPermission(
    var size, int taskid, String code, BuildContext context) async {
  final status = await Permission.locationWhenInUse.request();
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  final geolocationStatus = await geolocator.isLocationServiceEnabled();

  if (geolocationStatus) {
    if (status == PermissionStatus.granted) {
      getLocation(size, taskid, code, context);
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
