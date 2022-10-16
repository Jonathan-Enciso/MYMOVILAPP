// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: c4,
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
                  height: 180,
                  width: SizeConfig.screenWidth,
                  color: c1,
                  child: const Center(
                      child: Text(
                    'Solicitudes',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
            ),
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: c4,
                labelColor: Colors.white,
                isScrollable: true,
                unselectedLabelColor: c2,
                indicator: BoxDecoration(
                    color: c4, borderRadius: BorderRadius.circular(25.0)),
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.access_alarms,
                            size: MediaQuery.of(context).size.width * 0.03),
                        Text(' Pendientes',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                            ))
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.check,
                            size: MediaQuery.of(context).size.width * 0.03),
                        Text(' Aceptadas',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                            ))
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.close,
                            size: MediaQuery.of(context).size.width * 0.03),
                        Text(' Rechazadas',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                            ))
                      ],
                    ),
                  )
                ]),
          ),
          body: TabBarView(controller: _tabController, children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      height: SizeConfig.screenHeight * 0.20,
                      width: SizeConfig.screenWidth * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              c4.withOpacity(1), BlendMode.dstATop),
                          image: const AssetImage('assets/images/slopes.png'),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.pending_actions_rounded,
                                          color: c8,
                                          size: SizeConfig.screenWidth * 0.08),
                                      Text('Descanso',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth *
                                                      0.08,
                                              color: c8))
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('2022-05-14',
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.04,
                                                  color: c8)),
                                          Text('GRMK14166',
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.04,
                                                  color: c8,
                                                  decoration:
                                                      TextDecoration.underline))
                                        ],
                                      ))
                                ],
                              ))),
                    ))
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      height: SizeConfig.screenHeight * 0.20,
                      width: SizeConfig.screenWidth * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              c4.withOpacity(1), BlendMode.dstATop),
                          image: const AssetImage('assets/images/accepted.png'),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.check,
                                          color: c7,
                                          size: SizeConfig.screenWidth * 0.08),
                                      Text('Descanso',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth *
                                                      0.08,
                                              color: c7))
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('2022-05-14',
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.04,
                                                  color: c7)),
                                          Text('GRMK14166',
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.04,
                                                  color: c7,
                                                  decoration:
                                                      TextDecoration.underline))
                                        ],
                                      ))
                                ],
                              ))),
                    ))
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      height: SizeConfig.screenHeight * 0.20,
                      width: SizeConfig.screenWidth * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              c4.withOpacity(1), BlendMode.dstATop),
                          image: const AssetImage('assets/images/rejected.png'),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.close_rounded,
                                          color: c7,
                                          size: SizeConfig.screenWidth * 0.08),
                                      Text('Descanso',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth *
                                                      0.08,
                                              color: c7))
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('2022-05-14',
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.04,
                                                  color: c7)),
                                          Text('GRMK14166',
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.04,
                                                  color: c7,
                                                  decoration:
                                                      TextDecoration.underline))
                                        ],
                                      ))
                                ],
                              ))),
                    ))
              ],
            ),
          ]),
        ));
  }
}
