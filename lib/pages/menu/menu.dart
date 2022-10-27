import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 130,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: Customshape(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: c1,
                child: Center(
                    child: SvgPicture.asset('assets/images/Logo.svg',
                        width: SizeConfig.screenWidth * 0.35)),
              ),
            )),
        body: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    DateFormat.yMMMMd('es').format(DateTime.now()),
                    style: TextStyle(
                        color: c2, fontSize: SizeConfig.screenWidth * 0.035),
                  )),
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/user.svg',
                      width: 20,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/notifications.svg',
                      width: 20,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      color: c2,
                    ),
                    onPressed: () {
                      logout();
                    },
                  )
                ],
              )
            ]),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('¡Buen día \n' + name + '!',
                        style: TextStyle(
                            color: c1,
                            fontSize: SizeConfig.screenWidth * 0.07,
                            fontWeight: FontWeight.bold)))),
            Expanded(
                child: role == 1
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 8.0,
                            children: List.generate(menu.length, (index) {
                              return Center(
                                child: SelectCard(menu: menu[index]),
                              );
                            })))
                    : role == 2
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: GridView.count(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 8.0,
                                children: List.generate(menu1.length, (index) {
                                  return Center(
                                    child: SelectCard(menu: menu1[index]),
                                  );
                                })))
                        : role == 3
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 8.0,
                                    children:
                                        List.generate(menu2.length, (index) {
                                      return Center(
                                        child: SelectCard(menu: menu2[index]),
                                      );
                                    })))
                            : role == 4
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: GridView.count(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 8.0,
                                        children: List.generate(menu3.length,
                                            (index) {
                                          return Center(
                                            child:
                                                SelectCard(menu: menu3[index]),
                                          );
                                        })))
                                : Container()),
            SvgPicture.asset('assets/icons/sheetGreen.svg', width: 30)
          ],
        ));
  }

  void logout() async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('prelogin', (Route<dynamic> route) => false);
  }
}

class Menu {
  const Menu({this.title, this.icon, this.page});
  final String title;
  final Widget icon;
  final String page;
}

List<Menu> menu = <Menu>[
  Menu(
      title: 'Iniciar turno',
      icon: SvgPicture.asset('assets/icons/startShift.svg'),
      page: 'presentation'),
  Menu(
      title: 'Lista de chequeo',
      icon: SvgPicture.asset(
        'assets/icons/verifyVehicle.svg',
      ),
      page: 'checklist'),
  //Menu(
  //    title: 'Solicitudes',
  //    icon: SvgPicture.asset('assets/icons/requests.svg')),
  Menu(
      title: 'Lista de tareas',
      icon: SvgPicture.asset('assets/icons/thingsToDo.svg'),
      page: 'tasklist'),
  //Menu(
  //    title: 'Cambio de ruta TM',
  //    icon: SvgPicture.asset('assets/icons/deviate.svg')),
  //Menu(title: 'Bienestar', icon: SvgPicture.asset('assets/icons/wellness.svg')),
  //Menu(title: 'Entérate', icon: SvgPicture.asset('assets/icons/findOut.svg')),
  Menu(
      title: 'Cierre turno',
      icon: SvgPicture.asset('assets/icons/routes.svg'),
      page: 'closingShift'),
  Menu(
      title: 'TP',
      icon: SvgPicture.asset('assets/icons/routes.svg'),
      page: 'yardTechnician'),
];

List<Menu> menu1 = <Menu>[
  Menu(
      title: 'Crear Lavado \n (ZMO III)',
      icon: Icon(Icons.create, color: c7),
      page: 'washingcreate63'),
  Menu(
      title: 'Lavados Abiertos \n (ZMO III)',
      icon: SvgPicture.asset(
        'assets/icons/verifyVehicle.svg',
      ),
      page: 'openWashing63'),
];

List<Menu> menu2 = <Menu>[
  Menu(
      title: 'Crear Lavado \n (ZMO V)',
      icon: Icon(Icons.create, color: c7),
      page: 'washingcreate67'),
  Menu(
      title: 'Lavados Abiertos \n (ZMO V)',
      icon: SvgPicture.asset('assets/icons/verifyVehicle.svg'),
      page: 'openWashing67')
];

List<Menu> menu3 = <Menu>[
  Menu(
      title: 'Cerrar Lavado \n (ZMO III)',
      icon: Icon(Icons.assignment_turned_in_rounded, color: c7),
      page: 'closeWashing63'),
  Menu(
      title: 'Cerrar Lavado \n (ZMO V)',
      icon: Icon(Icons.assignment_turned_in_rounded, color: c7),
      page: 'closeWashing67'),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.menu}) : super(key: key);
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        elevation: 6,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: c3),
                    child: IconButton(
                      icon: menu.icon,
                      onPressed: () {
                        Navigator.pushNamed(context, menu.page);
                      },
                    ),
                  ),
                ),
                Text(
                  menu.title,
                  style: const TextStyle(fontSize: 7),
                  textAlign: TextAlign.center,
                ),
              ]),
        ));
  }
}
