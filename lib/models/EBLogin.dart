// To parse this JSON data, do
//
//     final ebLogin = ebLoginFromJson(jsonString);

import 'dart:convert';

EbLogin ebLoginFromJson(String str) => EbLogin.fromJson(json.decode(str));

String ebLoginToJson(EbLogin data) => json.encode(data.toJson());

class EbLogin {
  EbLogin({
    this.colCod,
    this.comId,
    this.idUf,
    this.objVal,
    this.rigId,
    this.rolId,
    this.task,
    this.useComId,
    this.useComNam,
    this.useComSta,
    this.useComUse,
    this.idUfName,
    this.token,
    this.useComPas,
    this.version,
  });

  String colCod;
  int comId;
  int idUf;
  ObjVal objVal;
  String rigId;
  int rolId;
  int task;
  int useComId;
  String useComNam;
  bool useComSta;
  String useComUse;
  String idUfName;
  String token;
  String useComPas;
  String version;
  factory EbLogin.fromJson(Map<String, dynamic> json) => EbLogin(
        colCod: json["col_cod"] == null ? null : json["col_cod"],
        comId: json["com_id"] == null ? null : json["com_id"],
        idUf: json["idUF"] == null ? null : json["idUF"],
        objVal:
            json["obj_val"] == null ? null : ObjVal.fromJson(json["obj_val"]),
        rigId: json["rig_id"] == null ? null : json["rig_id"],
        rolId: json["rol_id"] == null ? null : json["rol_id"],
        task: json["task"] == null ? null : json["task"],
        useComId: json["use_com_id"] == null ? null : json["use_com_id"],
        useComNam: json["use_com_nam"] == null ? null : json["use_com_nam"],
        useComSta: json["use_com_sta"] == null ? null : json["use_com_sta"],
        useComUse: json["use_com_use"] == null ? null : json["use_com_use"],
        idUfName: json["idUFName"] == null ? null : json["idUFName"],
        token: json["token"] == null ? null : json["token"],
        useComPas: json["use_com_pas"] == null ? null : json["use_com_pas"],
        version: json["version"] == null ? null : json["version"],
      );

  Map<String, dynamic> toJson() => {
        "col_cod": colCod == null ? null : colCod,
        "com_id": comId == null ? null : comId,
        "idUF": idUf == null ? null : idUf,
        "obj_val": objVal == null ? null : objVal.toJson(),
        "rig_id": rigId == null ? null : rigId,
        "rol_id": rolId == null ? null : rolId,
        "task": task == null ? null : task,
        "use_com_id": useComId == null ? null : useComId,
        "use_com_nam": useComNam == null ? null : useComNam,
        "use_com_sta": useComSta == null ? null : useComSta,
        "use_com_use": useComUse == null ? null : useComUse,
        "idUFName": idUfName == null ? null : idUfName,
        "token": token == null ? null : token,
        "use_com_pas": useComPas == null ? null : useComPas,
        "version": version == null ? null : version,
      };
}

class ObjVal {
  ObjVal({
    this.wsMes,
    this.wsVal,
  });

  String wsMes;
  bool wsVal;

  factory ObjVal.fromJson(Map<String, dynamic> json) => ObjVal(
        wsMes: json["ws_mes"],
        wsVal: json["ws_val"],
      );

  Map<String, dynamic> toJson() => {
        "ws_mes": wsMes,
        "ws_val": wsVal,
      };
}
