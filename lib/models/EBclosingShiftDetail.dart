// To parse this JSON data, do
//
//     final eBclosingShiftDetail = eBclosingShiftDetailFromJson(jsonString);

import 'dart:convert';

EBclosingShiftDetail eBclosingShiftDetailFromJson(String str) => EBclosingShiftDetail.fromJson(json.decode(str));

String eBclosingShiftDetailToJson(EBclosingShiftDetail data) => json.encode(data.toJson());

class EBclosingShiftDetail {
  EBclosingShiftDetail({
    this.message,
    this.valid,
    this.data,
    this.listData,
    this.status,
    this.idData,
  });

  String message;
  bool valid;
  Data data;
  List<Data> listData;
  int status;
  int idData;

  factory EBclosingShiftDetail.fromJson(Map<String, dynamic> json) => EBclosingShiftDetail(
    message: json["message"],
    valid: json["valid"],
    data: Data.fromJson(json["data"]),
    listData: List<Data>.from(json["list_data"].map((x) => Data.fromJson(x))),
    status: json["status"],
    idData: json["id_data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "valid": valid,
    "data": data.toJson(),
    "list_data": List<dynamic>.from(listData.map((x) => x.toJson())),
    "status": status,
    "id_data": idData,
  };
}

class Data {
  Data({
    this.employee,
    this.idTask,
    this.idStopPoint,
    this.stopPoint,
    this.lastVehicleChecked,
    this.timeDestiny,
    this.timeEndApp,
  });

  String employee;
  int idTask;
  int idStopPoint;
  String stopPoint;
  String lastVehicleChecked;
  String timeDestiny;
  String timeEndApp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    employee: json["employee"],
    idTask: json["id_task"],
    idStopPoint: json["id_stop_point"],
    stopPoint: json["stop_point"],
    lastVehicleChecked: json["last_vehicle_checked"],
    timeDestiny: json["time_destiny"],
    timeEndApp: json["time_end_app"],
  );

  Map<String, dynamic> toJson() => {
    "employee": employee,
    "id_task": idTask,
    "id_stop_point": idStopPoint,
    "stop_point": stopPoint,
    "last_vehicle_checked": lastVehicleChecked,
    "time_destiny": timeDestiny,
    "time_end_app": timeEndApp,
  };
}
