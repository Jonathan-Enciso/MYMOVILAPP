import 'package:flutter/material.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';

final ButtonStyle sButton = ElevatedButton.styleFrom(
    primary: c4,
    minimumSize: Size(SizeConfig.screenWidth * 0.4, 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)));

final TextStyle sTextButton = TextStyle(
  fontSize: SizeConfig.screenWidth * 0.05,
  color: Colors.white,
);
