import 'dart:async';

import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/models/EBLogin.dart';
import 'package:mymovilapp/pages/menu/menu.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';
import 'package:mymovilapp/widgets/alerts/SuccessProcess.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

String code = '';
String token = '';
int role;
int idUF;
int comId;
String idUfName;
String user = '';
String name = '';
String pass = '';
String version = '';
Timer timer;

void findUser(String usecomuse, bool qrcode, int comid, String usecompas,
    var size, var context) async {
  EbLogin responseWS;

  if (usecomuse.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        timer = Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return errorProcessAlert('Verifica la información');
      },
    );
  } else if (usecompas.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        timer = Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return errorProcessAlert('Verifica la información');
      },
    );
  } else if (comid == 0) {
    showDialog(
      context: context,
      builder: (context) {
        timer = Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return errorProcessAlert('Verifica la información');
      },
    );
  } else {
    var response = await http.post(Uri.parse(userLogin),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "use_com_use": usecomuse,
          "qrcode": qrcode,
          "com_id": comid,
          "use_com_pas": usecompas
        }));
    responseWS = ebLoginFromJson(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      if (responseWS.objVal.wsVal) {
        showDialog(
          context: context,
          builder: (context) {
            timer = Timer(Duration(seconds: 1), () {
              Navigator.of(context).pop();
            });
            return successProcessAlert('Acceso exitoso');
          },
        );
        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MenuPage()));
        });

        idUfName = responseWS.idUfName;
        comId = responseWS.comId;
        idUF = responseWS.idUf;
        code = responseWS.colCod;
        token = responseWS.token;
        role = responseWS.rolId;
        user = responseWS.useComUse;
        pass = responseWS.useComPas;
        name = responseWS.useComNam;
        version = responseWS.version;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            timer = Timer(Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return errorProcessAlert(responseWS.objVal.wsMes);
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return errorProcessAlert(responseWS.objVal.wsMes);
        },
      );
    }
  }
}
