import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/data/style.dart';

class PreloginPage extends StatefulWidget {
  const PreloginPage({Key key}) : super(key: key);

  @override
  State<PreloginPage> createState() => _PreloginPageState();
}

class _PreloginPageState extends State<PreloginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: c1,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: SvgPicture.asset('assets/images/Logo.svg',
                width: SizeConfig.screenWidth * 0.35),
          ),
          SvgPicture.asset(
            'assets/images/Prelogin.svg',
            height: SizeConfig.screenHeight * 0.4,
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(200, 90)),
                  color: Colors.white,
                ),
                child: Center(
                    child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                        child: Text(
                          'Movilidad eléctrica \n para Bogotá',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: c1,
                              fontSize: SizeConfig.screenWidth * 0.06,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      'Gestiona tu operación, solicitudes, \n descansos y muchos más.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: c2, fontSize: SizeConfig.screenWidth * 0.030),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                        child: ElevatedButton(
                          style: sButton,
                          onPressed: () =>
                              {Navigator.pushNamed(context, "login")},
                          child: Text('Ingresar', style: sTextButton),
                        )),
                    Text(
                      '2022 - Versión 2.0.0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: c2, fontSize: SizeConfig.screenWidth * 0.030),
                    )
                  ],
                ))),
          )
        ],
      ),
    );
  }
}
