import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/data/user.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:mymovilapp/models/EBtaskOperator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class TasklistPage extends StatefulWidget {
  const TasklistPage({Key key}) : super(key: key);

  @override
  State<TasklistPage> createState() => _TasklistPageState();
}

class _TasklistPageState extends State<TasklistPage> {
  Future<EBtaskOperator> _future;

  @override
  void initState() {
    _future = getTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: Customshape(),
            child: Container(
                height: 250,
                width: SizeConfig.screenWidth,
                color: c1,
                child: const Center(
                    child: Text(
                  'Lista de tareas',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
        ),
        body: Column(
          children: [
            Center(
                child: new SingleChildScrollView(
              child: new Container(
                padding: const EdgeInsets.symmetric(),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.70,
                child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) => snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.listData.length,
                            itemBuilder: (context, index) => Card(
                                  child: InkWell(
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    margin: const EdgeInsets.only(
                                      top: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      snapshot
                                                                      .data
                                                                      .listData[
                                                                          index]
                                                                      .task ==
                                                                  null ||
                                                              snapshot
                                                                      .data
                                                                      .listData[
                                                                          index]
                                                                      .task ==
                                                                  "" ||
                                                              snapshot
                                                                      .data
                                                                      .listData[
                                                                          index]
                                                                      .task ==
                                                                  ''
                                                          ? ''
                                                          : snapshot
                                                              .data
                                                              .listData[index]
                                                              .task,
                                                      style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .screenWidth *
                                                            0.045,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: c8,
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.grey,
                                                      height: 10,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: 'Origen: ',
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot.data.listData[index].stopFrom ==
                                                                        null ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .stopFrom ==
                                                                        "" ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .stopFrom ==
                                                                        ''
                                                                ? ''
                                                                : snapshot
                                                                    .data
                                                                    .listData[
                                                                        index]
                                                                    .stopFrom,
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: 'Destino: ',
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot.data.listData[index].stopTo ==
                                                                        null ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .stopTo ==
                                                                        "" ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .stopTo ==
                                                                        ''
                                                                ? ''
                                                                : snapshot
                                                                    .data
                                                                    .listData[
                                                                        index]
                                                                    .stopTo,
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Hora Inicio: ',
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot.data.listData[index].timeOrigin ==
                                                                        null ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .timeOrigin ==
                                                                        "" ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .timeOrigin ==
                                                                        ''
                                                                ? ''
                                                                : snapshot
                                                                    .data
                                                                    .listData[
                                                                        index]
                                                                    .timeOrigin,
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: 'Hora Fin: ',
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot.data.listData[index].timeDestiny ==
                                                                        null ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .timeDestiny ==
                                                                        "" ||
                                                                    snapshot
                                                                            .data
                                                                            .listData[
                                                                                index]
                                                                            .timeDestiny ==
                                                                        ''
                                                                ? ''
                                                                : snapshot
                                                                    .data
                                                                    .listData[
                                                                        index]
                                                                    .timeDestiny,
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.035,
                                                                color: c8),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                      ],
                                    ),
                                  )),
                                ))
                        : Center(
                            child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Cargando...')],
                          ))),
              ),
            )),
          ],
        ));
  }

  Future<EBtaskOperator> getTask() async {
    var obj;
    try {
      var headers = {'Authorization': 'bearer ' + token};
      var response = await http.get(Uri.encodeFull(tasklist + code), headers: headers);
      if (response.statusCode == 200) {
        obj = eBtaskOperatorFromJson(utf8.decode(response.bodyBytes));
      } else {
        print(response.reasonPhrase);
      }
    } catch (Exception) {
      print(Exception);
      return obj;
    }
    return obj;
  }
}
