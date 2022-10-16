import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';

AlertDialog alert = AlertDialog(
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0))),
  contentPadding: const EdgeInsets.only(top: 10.0),
  content: SizedBox(
    width: SizeConfig.screenWidth * 0.8,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/alert.svg',
          height: SizeConfig.screenHeight * 0.1,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
            child: Text(
              'Código no identificado',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: c1,
                  fontSize: SizeConfig.screenWidth * 0.06,
                  fontWeight: FontWeight.bold),
            )),
      ],
    ),
  ),
);
