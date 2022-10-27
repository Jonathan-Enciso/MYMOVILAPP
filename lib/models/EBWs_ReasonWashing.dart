// To parse this JSON data, do
//
//     final ebWsReasonWashing = ebWsReasonWashingFromJson(jsonString);

import 'dart:convert';

List<EbWsReasonWashing> ebWsReasonWashingFromJson(String str) => List<EbWsReasonWashing>.from(json.decode(str).map((x) => EbWsReasonWashing.fromJson(x)));

String ebWsReasonWashingToJson(List<EbWsReasonWashing> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EbWsReasonWashing {
    EbWsReasonWashing({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory EbWsReasonWashing.fromJson(Map<String, dynamic> json) => EbWsReasonWashing(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
