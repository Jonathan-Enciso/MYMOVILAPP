import 'package:flutter/material.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/services/yardTechnician/api_manager.dart';

import 'package:mymovilapp/models/EbAvailable.dart';

class YardTechnician extends StatefulWidget {
  @override
  _YardTechnicianState createState() => _YardTechnicianState();
}

class _YardTechnicianState extends State<YardTechnician> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrientationList(),
    );
  }
}

class OrientationList extends StatelessWidget {
  OrientationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Column(children: [
                  Container(
                      color: Colors.red,
                      height: SizeConfig.screenHeight * 0.50),
                  Container(
                    color: Colors.green,
                    height: SizeConfig.screenHeight * 0.50,
                  )
                ])
              : Row(children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.70,
                    child: Column(children: [
                      Container(
                          color: c5,
                          height: SizeConfig.screenHeight * 0.85,
                          width: SizeConfig.screenWidth * 0.70,
                          child: Text("Entradas y salidas")),
                      Container(
                          color: c5,
                          height: SizeConfig.screenHeight * 0.15,
                          width: SizeConfig.screenWidth * 0.70,
                          child: FutureBuilder<EbAvailable>(
                              future: fetchListAvailable(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Container(
                                      child: snapshot.data.listData == null
                                          ? Text("Sin Vehiculos Disponibles")
                                          : ListView.builder(
                                              itemCount:
                                                  snapshot.data.listData.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10.0, 0, 10.0, 0.0),
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 2),
                                                      decoration: BoxDecoration(
                                                        color: c4,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    24)),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0.0,
                                                                      10,
                                                                      0.0,
                                                                      0.0),
                                                              child: Text(
                                                                snapshot
                                                                    .data
                                                                    .listData[
                                                                        index]
                                                                    .codeVehicle,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                          Center(
                                                            child: Icon(
                                                                Icons
                                                                    .directions_bus_rounded,
                                                                size: 40,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Center(
                                                            child: Text(
                                                                snapshot
                                                                    .data
                                                                    .listData[
                                                                        index]
                                                                    .typeVehicle,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              }));
                                }
                              }))
                    ]),
                  ),
                  Container(
                      color: c1,
                      child: Column(children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.30,
                          width: SizeConfig.screenWidth * 0.30,
                          color: c1,
                          child:
                              Image.asset('assets/images/green_negativo.png'),
                        ),
                        Divider(color: c7),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  color: c9,
                                  width: SizeConfig.screenWidth * 0.10,
                                  height: SizeConfig.screenHeight * 0.15,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "999",
                                          style: TextStyle(
                                              color: c7,
                                              fontSize: SizeConfig.screenWidth *
                                                  0.05),
                                        ),
                                        Text("Entradas",
                                            style: TextStyle(
                                                color: c6,
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.01)),
                                      ])),
                              Container(
                                  color: c9,
                                  width: SizeConfig.screenWidth * 0.10,
                                  height: SizeConfig.screenHeight * 0.15,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "999",
                                          style: TextStyle(
                                              color: c7,
                                              fontSize: SizeConfig.screenWidth *
                                                  0.05),
                                        ),
                                        Text("Salidas",
                                            style: TextStyle(
                                                color: c6,
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.01)),
                                      ])),
                              Container(
                                  color: c9,
                                  width: SizeConfig.screenWidth * 0.10,
                                  height: SizeConfig.screenHeight * 0.15,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "999",
                                          style: TextStyle(
                                              color: c7,
                                              fontSize: SizeConfig.screenWidth *
                                                  0.05),
                                        ),
                                        Text("En Patio",
                                            style: TextStyle(
                                                color: c6,
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.01)),
                                      ]))
                            ]),
                        Divider(color: c7),
                        Text(
                          "Funcionalidades:",
                          style: TextStyle(color: c7),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: SizeConfig.screenHeight * 0.10,
                              child: SizedBox.fromSize(
                                size: Size(
                                    SizeConfig.screenWidth * 0.08,
                                    SizeConfig.screenWidth *
                                        0.08), // button width and height
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: c9, // button color
                                  child: InkWell(
                                    splashColor: Color.fromRGBO(248, 177, 1, 1),
                                    // splash color
                                    onTap: () {},
                                    // button pressed
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.people,
                                          color: Colors.white,
                                        ), // icon
                                        Text(
                                          "Novedades",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: SizeConfig.screenHeight * 0.10,
                              child: SizedBox.fromSize(
                                size: Size(
                                    SizeConfig.screenWidth * 0.08,
                                    SizeConfig.screenWidth *
                                        0.08), // button width and height
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: c9, // button color
                                  child: InkWell(
                                    splashColor: Color.fromRGBO(248, 177, 1, 1),
                                    // splash color
                                    onTap: () {},
                                    // button pressed
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.autorenew_rounded,
                                          color: Colors.white,
                                        ), // icon
                                        Text(
                                          "Cambio Móvil",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: SizeConfig.screenHeight * 0.10,
                              child: SizedBox.fromSize(
                                size: Size(
                                    SizeConfig.screenWidth * 0.08,
                                    SizeConfig.screenWidth *
                                        0.08), // button width and height
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: c9, // button color
                                  child: InkWell(
                                    splashColor: Color.fromRGBO(248, 177, 1, 1),
                                    // splash color
                                    onTap: () {},
                                    // button pressed
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.build,
                                          color: Colors.white,
                                        ), // icon
                                        Text(
                                          "Daño Flota",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: SizeConfig.screenHeight * 0.10,
                          child: SizedBox.fromSize(
                            size: Size(
                                SizeConfig.screenWidth * 0.27,
                                SizeConfig.screenWidth *
                                    0.08), // button width and height
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: c9, // button color
                              child: InkWell(
                                splashColor: Color.fromRGBO(248, 177, 1, 1),
                                // splash color
                                onTap: () {},
                                // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ), // icon
                                    Text(
                                      "Consultas",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                      width: SizeConfig.screenWidth * 0.30,
                      height: SizeConfig.screenHeight)
                ]);
        },
      ),
    );
  }
}
