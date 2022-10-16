import 'dart:convert';

EBtaskOperator eBtaskOperatorFromJson(String str) =>
    EBtaskOperator.fromJson(json.decode(str));

String eBtaskOperatorToJson(EBtaskOperator data) => json.encode(data.toJson());

class EBtaskOperator {
  EBtaskOperator({
    this.message,
    this.valid,
    this.data,
    this.listData,
    this.status,
    this.idData,
  });

  String message;
  bool valid;
  dynamic data;
  List<ListDatum> listData;
  int status;
  dynamic idData;

  factory EBtaskOperator.fromJson(Map<String, dynamic> json) => EBtaskOperator(
        message: json["message"],
        valid: json["valid"],
        data: json["data"],
        listData: List<ListDatum>.from(
            json["list_data"].map((x) => ListDatum.fromJson(x))),
        status: json["status"],
        idData: json["id_data"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "valid": valid,
        "data": data,
        "list_data": List<dynamic>.from(listData.map((x) => x.toJson())),
        "status": status,
        "id_data": idData,
      };
}

class ListDatum {
  ListDatum({
    this.timeOrigin,
    this.timeDestiny,
    this.task,
    this.codeVehicle,
    this.stopTo,
    this.stopFrom,
  });

  String timeOrigin;
  String timeDestiny;
  String task;
  String codeVehicle;
  String stopTo;
  String stopFrom;

  factory ListDatum.fromJson(Map<String, dynamic> json) => ListDatum(
        timeOrigin: json["time_origin"] == null ? null : json["time_origin"],
        timeDestiny: json["time_destiny"] == null ? null : json["time_destiny"],
        task: json["task"] == null ? null : json["task"],
        codeVehicle: json["code_vehicle"] == null ? null : json["code_vehicle"],
        stopTo: json["stop_to"] == null ? null : json["stop_to"],
        stopFrom: json["stop_from"] == null ? null : json["stop_from"],
      );

  Map<String, dynamic> toJson() => {
        "time_origin": timeOrigin == null ? null : timeOrigin,
        "time_destiny": timeDestiny == null ? null : timeDestiny,
        "task": task == null ? null : task,
        "code_vehicle": codeVehicle == null ? null : codeVehicle,
        "stop_to": stopTo == null ? null : stopTo,
        "stop_from": stopFrom == null ? null : stopFrom,
      };
}
