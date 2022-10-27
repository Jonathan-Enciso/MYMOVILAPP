import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/pages/login/login.dart';
import 'package:mymovilapp/pages/chekclist/cheklist.dart';
import 'package:mymovilapp/pages/chekclist/cheklistDetail.dart';
import 'package:mymovilapp/pages/closingShift/closingShift.dart';
import 'package:mymovilapp/pages/menu/menu.dart';
import 'package:mymovilapp/pages/login/prelogin.dart';
import 'package:mymovilapp/pages/presentation/presentation.dart';
import 'package:mymovilapp/pages/presentation/tasklist.dart';
import 'package:mymovilapp/pages/request/request.dart';
import 'package:mymovilapp/pages/yardTechnician/yardTechnician.dart';

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
        'checklist': (context) => CheckListPage(
              codeO: code,
            ),
        'checklistDetail': (context) => const CheckListDetailPage(),
        'tasklist': (context) => const TasklistPage(),
        'closingShift': (context) => const ClosingShiftPage(),
        'yardTechnician': (context) => YardTechnician(),
      },
      home: const PreloginPage(),
    );
  }
}
