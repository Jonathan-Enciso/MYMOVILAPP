// To parse this JSON data, do
//
//     final ebAvailable = ebAvailableFromJson(jsonString);

import 'dart:convert';

EbAvailable ebAvailableFromJson(String str) => EbAvailable.fromJson(json.decode(str));

String ebAvailableToJson(EbAvailable data) => json.encode(data.toJson());

class EbAvailable {
    EbAvailable({
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

    factory EbAvailable.fromJson(Map<String, dynamic> json) => EbAvailable(
        message: json["message"],
        valid: json["valid"],
        data: json["data"],
        listData: json["list_data"] == null ? null : List<ListDatum>.from(json["list_data"].map((x) => ListDatum.fromJson(x))),
        status: json["status"],
        idData: json["id_data"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "valid": valid,
        "data": data,
        "list_data": listData == null ? null : List<dynamic>.from(listData.map((x) => x.toJson())),
        "status": status,
        "id_data": idData,
    };
}

class ListDatum {
    ListDatum({
        this.codeVehicle,
        this.typeVehicle,
    });

    String codeVehicle;
    String typeVehicle;

    factory ListDatum.fromJson(Map<String, dynamic> json) => ListDatum(
        codeVehicle: json["code_vehicle"] == null ? null : json["code_vehicle"],
        typeVehicle: json["type_vehicle"] == null ? null : json["type_vehicle"],
    );

    Map<String, dynamic> toJson() => {
        "code_vehicle": codeVehicle == null ? null : codeVehicle,
        "type_vehicle": typeVehicle == null ? null : typeVehicle,
    };
}