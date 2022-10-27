import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/models/EBResponseGeneral.dart';
import 'dart:convert';

import 'package:mymovilapp/models/EBfindShiftStart.dart';
import 'package:mymovilapp/models/EBtaskOperator.dart';
import 'package:mymovilapp/pages/presentation/presentation.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';
import 'package:mymovilapp/widgets/alerts/SuccessProcess.dart';

Future<EBfindShiftStart> getValue() async {
  await Future.delayed(Duration(seconds: 1));
  EBfindShiftStart obj;
  try {
    var headers = {'Authorization': 'bearer ' + token};
    http.Response response =
        await http.get(Uri.encodeFull(findShiftStart + code), headers: headers);

    if (response.statusCode == 200) {
      obj = eBfindShiftStartFromJson(utf8.decode(response.bodyBytes));
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

Future<void> postSerconConfirm(double latitude, double longitude, int task,
    String code, int idstop, var size, BuildContext context) async {
  var headers = {
    'Authorization': 'bearer ' + token,
    'Content-Type': 'application/json'
  };
  var body = json.encode({
    "longitude": longitude.toString(),
    "code": code,
    "latitude": latitude.toString(),
    "id_task": task,
    "id_stop": idstop.toString()
  });

  final response = await http.post(serconConfirm,
      headers: headers, body: body, encoding: Encoding.getByName("utf-8"));

  if (response.statusCode == 200) {
    EbResponseGeneral ebSerconConfirm =
        ebResponseGeneralFromJson(utf8.decode(response.bodyBytes));
    if (ebSerconConfirm.valid) {
      showDialog(
        context: context,
        builder: (context) {
          return successProcessAlert("¡Presentación exitosa!");
        },
      );
      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PresentationPage()));
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return errorProcessAlert(ebSerconConfirm.message);
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

Future<EBtaskOperator> getTask() async {
  var obj;
  try {
    var headers = {'Authorization': 'bearer ' + token};
    var response =
        await http.get(Uri.encodeFull(tasklist + code), headers: headers);
    if (response.statusCode == 200) {
      obj = eBtaskOperatorFromJson(utf8.decode(response.bodyBytes));
    } else {
      print(response.reasonPhrase);
    }
  } catch (Exception) {
    print(Exception);
    return obj;
  }
  return obj;
}
