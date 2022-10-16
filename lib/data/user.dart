import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/models/EBLogin.dart';
import 'package:mymovilapp/pages/menu.dart';
import 'package:mymovilapp/widgets/alerts/SuccessCode.dart';
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

void findUser(String usecomuse, bool qrcode, int comid, String usecompas,
    var size, var context) async {
  EbLogin responseWS;

  if (usecomuse.isEmpty) {
    //errorDialog(context, 'Identificación vacía', size, 4);
  } else if (usecompas.isEmpty) {
    //errorDialog(context, 'Contraseña vacía', size, 4);
  } else if (comid == 0) {
    //errorDialog(context, 'Seleccionar compañía', size, 4);
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
            return alertSuccess;
          },
        );
        await Future.delayed(const Duration(seconds: 3), () {
     
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MenuPage()));
              
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
        //  errorDialog(context, responseWS.objVal.wsMes, size, 4);
      }
    } else {
      //    errorDialog(context, responseWS.objVal.wsMes, size, 4);
    }
  }
}
