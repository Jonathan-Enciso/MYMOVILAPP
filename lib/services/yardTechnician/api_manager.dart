import 'dart:convert';

import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/models/EbAvailable.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mymovilapp/session/user.dart';

Future<EbAvailable> fetchListAvailable() async {
  await Future.delayed(Duration(seconds: 1));
  EbAvailable obj;
  try {
    var headers = {'Authorization': 'bearer ' + token};
    http.Response response = await http.get(
        Uri.encodeFull(vehiclesAvailable + "?idUF=" + idUF.toString()),
        headers: headers);

    if (response.statusCode == 200) {
      obj = ebAvailableFromJson(utf8.decode(response.bodyBytes));
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
