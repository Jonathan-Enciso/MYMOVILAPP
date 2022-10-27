import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/services/presentation/api_manager.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/models/EBfindShiftStart.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
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
                  'Mi turno',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
        ),
        body: FutureBuilder(
          future: _value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Cargando...')],
              ));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                if (snapshot.data.valid) {
                  if (snapshot.data.data.isShiftStarted) {
                    if (snapshot.data.data.drivingService != null) {
                      return SingleChildScrollView(
                          child: Column(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      DateFormat.yMMMMd('es')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: c2,
                                          fontSize:
                                              SizeConfig.screenWidth * 0.035),
                                    )),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                          'assets/icons/help.svg',
                                          width: 20),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ]),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(' Tarea de conducción ',
                                      style: TextStyle(
                                          color: c2,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.screenWidth * 0.035)))
                            ],
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Container(
                                height: SizeConfig.screenHeight * 0.20,
                                width: SizeConfig.screenWidth * 0.80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    colorFilter: ColorFilter.mode(
                                        c4.withOpacity(1), BlendMode.dstATop),
                                    image: const AssetImage(
                                        'assets/images/request.png'),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data.data.drivingService.stop,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.screenHeight * 0.035),
                                    ),
                                    Text(
                                      snapshot.data.data.drivingService
                                              .vehicle +
                                          (snapshot.data.data.drivingService
                                                      .stop ==
                                                  "Centro Logistico ZMOV"
                                              ? " - " +
                                                  snapshot.data.data.busLocation
                                              : ""),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.screenHeight * 0.025),
                                    )
                                  ],
                                )),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Container(
                                height: SizeConfig.screenHeight * 0.08,
                                width: SizeConfig.screenWidth * 0.80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: c3,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.access_alarms_rounded,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              snapshot.data.data.drivingService
                                                  .timeOrigin,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      SizeConfig.screenHeight *
                                                          0.03),
                                            )
                                          ],
                                        ))),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 50, 10, 10),
                              child: SvgPicture.asset(
                                  'assets/icons/sheetGreen.svg',
                                  width: 30))
                        ],
                      ));
                    } else {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child:
                              Text('No cuentas con servicios de conducción.'));
                    }
                  } else {
                    if (snapshot.data.data.presentationService != null) {
                      return SingleChildScrollView(
                          child: Column(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      DateFormat.yMMMMd('es')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: c2,
                                          fontSize:
                                              SizeConfig.screenWidth * 0.035),
                                    )),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                          'assets/icons/help.svg',
                                          width: 20),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ]),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(' Tarea de presentación',
                                      style: TextStyle(
                                          color: c2,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.screenWidth * 0.035)))
                            ],
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Container(
                                height: SizeConfig.screenHeight * 0.20,
                                width: SizeConfig.screenWidth * 0.80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    colorFilter: ColorFilter.mode(
                                        c4.withOpacity(1), BlendMode.dstATop),
                                    image: const AssetImage(
                                        'assets/images/request.png'),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                    child: Text(
                                  snapshot.data.data.presentationService.stop,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.screenHeight * 0.035),
                                )),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Container(
                                height: SizeConfig.screenHeight * 0.08,
                                width: SizeConfig.screenWidth * 0.80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: c3,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.access_alarms_rounded,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              snapshot
                                                  .data
                                                  .data
                                                  .presentationService
                                                  .timeOrigin,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      SizeConfig.screenHeight *
                                                          0.03),
                                            )
                                          ],
                                        ))),
                              )),
                          snapshot.data.data.presentationService.expired
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                      'Fuera del horario \n de presentación'))
                              : Column(children: [
                                  Center(
                                    child: IconButton(
                                      iconSize: 100,
                                      icon: SvgPicture.asset(
                                        'assets/icons/confirmPresentation.svg',
                                      ),
                                      onPressed: () =>
                                          requestLocationPermission(
                                              SizeConfig.screenWidth,
                                              snapshot.data.data
                                                  .presentationService.idTask,
                                              code,
                                              snapshot.data.data
                                                  .presentationService.idStop,
                                              context),
                                    ),
                                  ),
                                  Text(
                                    'Confirmar presentación',
                                    style: TextStyle(color: c1),
                                  ),
                                ]),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 50, 10, 10),
                              child: SvgPicture.asset(
                                  'assets/icons/sheetGreen.svg',
                                  width: SizeConfig.screenWidth * 0.06))
                        ],
                      ));
                    } else {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                              'No cuentas con servicios de presentación.'));
                    }
                  }
                } else {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(snapshot.data.message));
                }
              } else {
                return const Center(
                    child: Text(
                        'Sal e ingresa nuevamente, puede presentarse lentitud en la red.'));
              }
            } else {
              return Text('Estado de red: ${snapshot.connectionState}');
            }
          },
        ));
  }
}

void getLocation(
    var size, int taskid, String code, int idstop, BuildContext context) async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  postSerconConfirm(position.latitude, position.longitude, taskid, code, idstop,
      size, context);
}

Future<void> requestLocationPermission(
    var size, int taskid, String code, int idstop, BuildContext context) async {
  final status = await Permission.locationWhenInUse.request();
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  final geolocationStatus = await geolocator.isLocationServiceEnabled();

  if (geolocationStatus) {
    if (status == PermissionStatus.granted) {
      getLocation(size, taskid, code, idstop, context);
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
