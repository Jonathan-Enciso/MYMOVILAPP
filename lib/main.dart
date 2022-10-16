import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mymovilapp/pages/Login.dart';
import 'package:mymovilapp/pages/cheklist.dart';
import 'package:mymovilapp/pages/cheklistDetail.dart';
import 'package:mymovilapp/pages/closingShift.dart';
import 'package:mymovilapp/pages/menu.dart';
import 'package:mymovilapp/pages/prelogin.dart';
import 'package:mymovilapp/pages/presentation.dart';
import 'package:mymovilapp/pages/tasklist.dart';
import 'package:mymovilapp/pages/request.dart';

void main() {
  runApp(const MyApp());
  initializeDateFormatting();
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "Poppins",
      ),
      routes: {
        'prelogin': (context) => const PreloginPage(),
        'login': (context) => const LoginPage(),
        'menu': (context) => const MenuPage(),
        'request': (context) => const RequestPage(),
        'presentation': (context) => const PresentationPage(),
        'checklist': (context) => const CheckListPage(),
        'checklistDetail': (context) => const CheckListDetailPage(),
        'tasklist': (context) => const TasklistPage(),
        'closingShift': (context) => const ClosingShiftPage(),
      },
      home: const PreloginPage(),
    );
  }
}
