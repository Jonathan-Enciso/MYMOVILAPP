// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';

class CheckListPage extends StatefulWidget {
  const CheckListPage({Key key}) : super(key: key);

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
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
                  'Lista de chequeo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    DateFormat.yMMMMd('es').format(DateTime.now()),
                    style: TextStyle(
                        color: c2,
                        fontSize: SizeConfig.screenWidth * 0.035),
                  )),
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/help.svg', width: 20),
                    onPressed: () {},
                  )
                ],
              ),
            ]),
            Center(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(
                      'Encane el código \n ubicado en el panorámico',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: c1),
                    )),
                SvgPicture.asset('assets/icons/scannerBus.svg',
                    width: SizeConfig.screenWidth * 0.80),
                const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      thickness: 3,
                    )),
                IconButton(
                  iconSize: 100,
                  icon: SvgPicture.asset(
                    'assets/icons/buttonCamera.svg',
                  ),
                  onPressed: () {},
                ),
              ],
            )),
            Text(
              'Escanear',
              style: TextStyle(color: c1),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child:
                    SvgPicture.asset('assets/icons/sheetGreen.svg', width: 30))
          ],
        )));
  }
}
