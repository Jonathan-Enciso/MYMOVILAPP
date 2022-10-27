import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/models/EBResponseGeneral.dart';
import 'package:mymovilapp/models/EbCheckListItems.dart';
import 'package:mymovilapp/pages/chekclist/cheklistDetail.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';

String codebusmanual = "";

class CheckListPage extends StatefulWidget {
  const CheckListPage({this.codeO});
  final String codeO;
  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  String _scanBarcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
            ),
            onPressed: ({codebusmanual = ""}) => Navigator.of(context).pop(),
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
                  'Lista de chequeo',
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
                children: [],
              ),
            ]),
            Center(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(
                      'Escanee el código \n ubicado en el panorámico \n o escriba el código del bus \n separado por guión',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: c1),
                    )),
                SvgPicture.asset('assets/icons/scannerBus.svg',
                    width: SizeConfig.screenWidth * 0.80),
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      thickness: 3,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: TextFormField(
                        inputFormatters: [UpperCaseTextFormatter()],
                        onChanged: (text) async {
                          codebusmanual = text;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Código de bus',
                        ))),
                IconButton(
                  iconSize: 100,
                  icon: SvgPicture.asset(
                    'assets/icons/buttonCamera.svg',
                  ),
                  onPressed: () {
                    if (codebusmanual == "") {
                      _checkpermission_opencamera(SizeConfig.screenWidth);
                    } else {
                      getValidation(codebusmanual, widget.codeO);
                    }
                    codebusmanual = "";
                  },
                ),
              ],
            )),
            Text(
              'Escanear',
              style: TextStyle(color: c1),
            ),
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

      if (_scanBarcode == '-1') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return errorProcessAlert('Código no identificado');
          },
        );
      } else {
        if (_scanBarcode.contains(new RegExp(r"[a-z]"))) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return errorProcessAlert('Código no identificado');
            },
          );
          _scanBarcode = '';
        } else {
          getValidation(_scanBarcode, widget.codeO);
        }
      }
    });
  }

  Future<EbCheckListItems> getValidation(String code, String employee) async {
    await Future.delayed(Duration(seconds: 1));
    EbCheckListItems obj;
    try {
      var headers = {'Authorization': 'bearer ' + token};
      http.Response response = await http.get(
          Uri.encodeFull(saveQrValidation + code + "&employee=" + employee),
          headers: headers);
      if (response.statusCode == 200) {
        EbResponseGeneral ebValidation =
            ebResponseGeneralFromJson(utf8.decode(response.bodyBytes));
        if (ebValidation.message != "Proceso realizado con éxito") {
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
                  ebValidation.message,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )..show();
        } else {
          String codigoOperador;
          String codigoVehiculo;
          if (codebusmanual == "") {
            codigoOperador = widget.codeO;
            codigoVehiculo = _scanBarcode;
          } else {
            codigoVehiculo = codebusmanual;
          }

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CheckListDetailPage(
                  codeO: codigoOperador, codeV: codigoVehiculo)));
        }
      } else {
        //DIALOGO ERROR

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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
