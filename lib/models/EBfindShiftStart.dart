// To parse this JSON data, do
//
//     final eBfindShiftStart = eBfindShiftStartFromJson(jsonString);

import 'dart:convert';

EBfindShiftStart eBfindShiftStartFromJson(String str) => EBfindShiftStart.fromJson(json.decode(str));

String eBfindShiftStartToJson(EBfindShiftStart data) => json.encode(data.toJson());

class EBfindShiftStart {
    EBfindShiftStart({
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
    dynamic listData;
    int status;
    dynamic idData;

    factory EBfindShiftStart.fromJson(Map<String, dynamic> json) => EBfindShiftStart(
        message: json["message"],
        valid: json["valid"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        listData: json["list_data"],
        status: json["status"],
        idData: json["id_data"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "valid": valid,
        "data": data == null ? null : data.toJson(),
        "list_data": listData,
        "status": status,
        "id_data": idData,
    };
}

class Data {
    Data({
        this.presentationService,
        this.drivingService,
        this.isShiftStarted,
        this.dateShiftStarted,
        this.busLocation,
    });

    Service presentationService;
    Service drivingService;
    bool isShiftStarted;
    double dateShiftStarted;
    String busLocation;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        presentationService: json["presentation_service"] == null ? null : Service.fromJson(json["presentation_service"]),
        drivingService: json["driving_service"] == null ? null : Service.fromJson(json["driving_service"]),
        isShiftStarted: json["is_shift_started"] == null ? null : json["is_shift_started"],
        dateShiftStarted: json["date_shift_started"] == null ? null : json["date_shift_started"],
        busLocation: json["bus_location"] == null ? null : json["bus_location"],
    );

    Map<String, dynamic> toJson() => {
        "presentation_service": presentationService == null ? null : presentationService.toJson(),
        "driving_service": drivingService == null ? null : drivingService.toJson(),
        "is_shift_started": isShiftStarted == null ? null : isShiftStarted,
        "date_shift_started": dateShiftStarted == null ? null : dateShiftStarted,
        "bus_location": busLocation == null ? null : busLocation,
    };
}

class Service {
    Service({
        this.date,
        this.timeOrigin,
        this.idStop,
        this.stop,
        this.vehicle,
        this.idTask,
    });

    DateTime date;
    String timeOrigin;
    int idStop;
    String stop;
    String vehicle;
    int idTask;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        date: DateTime.parse(json["date"]),
        timeOrigin: json["time_origin"] == null ? null : json["time_origin"],
        idStop: json["id_stop"] == null ? null : json["id_stop"],
        stop: json["stop"] == null ? null : json["stop"],
        vehicle: json["vehicle"] == null ? null : json["vehicle"],
        idTask: json["id_task"] == null ? null : json["id_task"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_origin": timeOrigin == null ? null : timeOrigin,
        "id_stop": idStop == null ? null : idStop,
        "stop": stop == null ? null : stop,
        "vehicle": vehicle == null ? null : vehicle,
        "id_task": idTask == null ? null : idTask,
    };
}
