import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/models/EBResponseGeneral.dart';
import 'package:mymovilapp/models/EBclosingShiftDetail.dart';
import 'package:http/http.dart' as http;
import 'package:mymovilapp/pages/menu/menu.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';

Future<void> taskConfirm(double latitude, double longitude, String code_vehicle,
    var size, BuildContext context) async {
  var headers = {
    'Authorization': 'bearer ' + token,
    'Content-Type': 'application/json'
  };

  final response = await http.get(
      findEndShift + "employee=" + code + "&vehicle=" + code_vehicle,
      headers: headers);

  if (response.statusCode == 200) {
    final EBclosingShiftDetail eBclosingShiftDetail =
        eBclosingShiftDetailFromJson(utf8.decode(response.bodyBytes));
    if (eBclosingShiftDetail.data.idTask != null &&
        eBclosingShiftDetail.data.idTask > 0) {
      closedTask(latitude, longitude, code_vehicle,
          eBclosingShiftDetail.data.idTask, size, context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return errorProcessAlert(eBclosingShiftDetail.message);
        },
      );
    }
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return errorProcessAlert("Error Interno");
      },
    );
  }
}

Future<void> closedTask(double latitude, double longitude, String code_vehicle,
    int task, var size, BuildContext context) async {
  var headers = {
    'Authorization': 'bearer ' + token,
    'Content-Type': 'application/json'
  };
  var body = json.encode({
    "employee": code,
    "vehicle": code_vehicle,
    "id_task": task,
    "username": code,
    "longitude": longitude.toString(),
    "latitude": latitude.toString()
  });

  final response = await http.post(closedTask,
      headers: headers, body: body, encoding: Encoding.getByName("utf-8"));

  if (response.statusCode == 200) {
    EbResponseGeneral ebSerconConfirm =
        ebResponseGeneralFromJson(utf8.decode(response.bodyBytes));

    showDialog(
      context: context,
      builder: (context) {
        return errorProcessAlert(ebSerconConfirm.message);
      },
    );
    if (ebSerconConfirm.valid) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MenuPage()));
    }
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return errorProcessAlert("Error Interno");
      },
    );
  }
}
