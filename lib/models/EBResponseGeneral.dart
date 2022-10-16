// To parse this JSON data, do
//
//     final ebResponseGeneral = ebResponseGeneralFromJson(jsonString);

import 'dart:convert';

EbResponseGeneral ebResponseGeneralFromJson(String str) => EbResponseGeneral.fromJson(json.decode(str));

String ebResponseGeneralToJson(EbResponseGeneral data) => json.encode(data.toJson());

class EbResponseGeneral {
    EbResponseGeneral({
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
    dynamic listData;
    int status;
    dynamic idData;

    factory EbResponseGeneral.fromJson(Map<String, dynamic> json) => EbResponseGeneral(
        message: json["message"],
        valid: json["valid"],
        data: json["data"],
        listData: json["list_data"],
        status: json["status"],
        idData: json["id_data"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "valid": valid,
        "data": data,
        "list_data": listData,
        "status": status,
        "id_data": idData,
    };
}
