// To parse this JSON data, do
//
//     final ebWsTypeWashing = ebWsTypeWashingFromJson(jsonString);

import 'dart:convert';

List<EbWsTypeWashing> ebWsTypeWashingFromJson(String str) => List<EbWsTypeWashing>.from(json.decode(str).map((x) => EbWsTypeWashing.fromJson(x)));

String ebWsTypeWashingToJson(List<EbWsTypeWashing> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EbWsTypeWashing {
    EbWsTypeWashing({
        this.description,
        this.id,
        this.name,
        this.special,
    });

    String description;
    int id;
    String name;
    int special;

    factory EbWsTypeWashing.fromJson(Map<String, dynamic> json) => EbWsTypeWashing(
        description: json["description"],
        id: json["id"],
        name: json["name"],
        special: json["special"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "name": name,
        "special": special,
    };
}
