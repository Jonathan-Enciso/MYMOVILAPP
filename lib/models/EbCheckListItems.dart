// To parse this JSON data, do
//
//     final ebCheckListItems = ebCheckListItemsFromJson(jsonString);

import 'dart:convert';

EbCheckListItems ebCheckListItemsFromJson(String str) => EbCheckListItems.fromJson(json.decode(str));

String ebCheckListItemsToJson(EbCheckListItems data) => json.encode(data.toJson());

class EbCheckListItems {
    EbCheckListItems({
        this.vehicle,
        this.employee,
        this.username,
        this.checkUpFails,
    });

    String vehicle;
    String employee;
    String username;
    List<CheckUpFail> checkUpFails;

    factory EbCheckListItems.fromJson(Map<String, dynamic> json) => EbCheckListItems(
        vehicle: json["vehicle"],
        employee: json["employee"],
        username: json["username"],
        checkUpFails: List<CheckUpFail>.from(json["check_up_fails"].map((x) => CheckUpFail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vehicle": vehicle,
        "employee": employee,
        "username": username,
        "check_up_fails": List<dynamic>.from(checkUpFails.map((x) => x.toJson())),
    };
}

class CheckUpFail {
    CheckUpFail({
        this.idComponent,
        this.idComponentFails,
        this.status,
        this.description,
    });

    int idComponent;
    int idComponentFails;
    bool status;
    String description;

    factory CheckUpFail.fromJson(Map<String, dynamic> json) => CheckUpFail(
        idComponent: json["id_component"] == null ? null : json["id_component"],
        idComponentFails: json["id_component_fails"] == null ? null : json["id_component_fails"],
        status: json["status"] == null ? null : json["status"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id_component": idComponent == null ? null : idComponent,
        "id_component_fails": idComponentFails == null ? null : idComponentFails,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
    };
}
