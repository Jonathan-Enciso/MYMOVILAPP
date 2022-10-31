import 'dart:convert';
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mymovilapp/models/EBResponseGeneral.dart';
import 'package:mymovilapp/models/EBWs_ReasonWashing.dart';
import 'package:mymovilapp/data/typeWashing.dart';
import 'package:mymovilapp/models/EBWs_TypeWashing.dart';
import 'package:mymovilapp/data/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mymovilapp/data/datas.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mymovilapp/data/size.dart';
import 'package:mymovilapp/widgets/CustomShape.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymovilapp/data/style.dart';
import 'package:mymovilapp/session/user.dart';
import 'package:http/http.dart' as http;
import 'package:mymovilapp/data/urls.dart';
import 'package:mymovilapp/widgets/alerts/ErrorProcess.dart';
import 'package:mymovilapp/widgets/alerts/SuccessProcess.dart';

// Constructor
class WashingCreate extends StatefulWidget {
  const WashingCreate({this.code});
  final String code;

  @override
  _WashingCreateState createState() => _WashingCreateState();
}

// start State
class _WashingCreateState extends State<WashingCreate> {
  @override
  void initState() {
    super.initState();
    _type = null;
    _reason = null;
    typeWashingListEmpty = null;
  }

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final TextEditingController _typeAheadController1 = TextEditingController();

  bool _isLoading = true;
  String _scanVi = '';
  Timer timer;
  String _scanVq = '';
  String _observation = ' ';
  EbWsTypeWashing _type;
  EbWsReasonWashing _reason;
  bool enabled = false;
  String uf_nam;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    uf_nam = (idUF > 1) ? 'ZMO V' : 'ZMO III';

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
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
                child: Center(
                    child: Text(
                  'Registrar Lavado - ${uf_nam}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ))),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new IconButton(
                    icon: SvgPicture.asset('assets/icons/qr.svg',
                        height: SizeConfig.screenHeight * 0.6),
                    onPressed: () => {
                      enabled ? _onnull() : scanQRVehicle(size, idUF),
                      _onTapped()
                    },
                  ),
                  new Form(
                      key: this._formKey1,
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this._typeAheadController1,
                                decoration:
                                    InputDecoration(labelText: 'Vehiculo:'),
                                onChanged: (text) {
                                  setState(() {
                                    _type = null;
                                    _reason = null;
                                    typeWashingListEmpty = null;
                                  });
                                }),
                            suggestionsCallback: (pattern1) {
                              return getSuggestionsFull(pattern1, idUF);
                            },
                            itemBuilder: (context, suggestionv) {
                              return ListTile(
                                title: Text(suggestionv),
                              );
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            onSuggestionSelected: (suggestionv) {
                              this._typeAheadController1.text = suggestionv;
                              setState(() {
                                _scanVq = suggestionv;
                                typeWashingListEmpty = _scanVq
                                        .contains(new RegExp(r"Z6[37]-4\d{3}$"))
                                    ? typeWashingListBuseton
                                    : _scanVq.contains(
                                            new RegExp(r"Z6[37]-7\d{3}$"))
                                        ? typeWashingListPadron
                                        : null;
                                _type = null;
                              });
                            },
                            onSaved: (value1) => this._scanVi = value1),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<EbWsTypeWashing>(
                              value: _type,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: SizeConfig.screenWidth * 0.03,
                              ),
                              hint: Text('Seleccionar Tipo'),
                              onChanged: (EbWsTypeWashing newValue) {
                                setState(() {
                                  _type = newValue;
                                });
                              },
                              items: (typeWashingListEmpty)?.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenWidth * 0.025,
                                        ),
                                      ),
                                      value: item,
                                    );
                                  })?.toList() ??
                                  [],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _type != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _type.special == 1
                                ? Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child:
                                            DropdownButton<EbWsReasonWashing>(
                                          value: _reason,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize:
                                                SizeConfig.screenWidth * 0.03,
                                          ),
                                          hint: Text('Seleccionar Razón'),
                                          onChanged:
                                              (EbWsReasonWashing newValue) {
                                            setState(() {
                                              _reason = newValue;
                                            });
                                          },
                                          items: listReason?.map((item) {
                                                return new DropdownMenuItem(
                                                  child: new Text(
                                                    item.name,
                                                    style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.025,
                                                    ),
                                                  ),
                                                  value: item,
                                                );
                                              })?.toList() ??
                                              [],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        )
                      : Container(),
                  _type != null
                      ? _type.special == 1
                          ? _crearInputObservation()
                          : Container()
                      : Container(),
                  new ElevatedButton(
                    style: sButton,
                    onPressed: () => {
                      setState(() {
                        setState(() {
                          _isLoading = false;
                        });
                        enabled ? _onnull() : _submit(size, false);
                        _onTapped();
                      })
                    },
                    child: Text('Ingresar', style: sTextButton),
                  )
                ],
              ),
            )));
  }

  void _onnull() {
    return null;
  }

  Future _onTapped() async {
    super.initState();
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        enabled = false;
      });
    });
  }

// End state
  Future<void> fin() async {
    await Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isLoading = true;
      });
    });
  }

// Field Observation
  Widget _crearInputObservation() {
    return TextField(
        maxLength: 150,
        onChanged: (text) {
          _observation = text;
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: kPrimeryColor)),
            helperText: 'Realice una breve observación del acceso.',
            prefixIcon: Icon(
              Icons.textsms,
              color: kPrimeryColor,
            )));
  }

// Vehicle Data (QR)
  Future<void> scanQRVehicle(var size, int uf) async {
    String vehicle = await FlutterBarcodeScanner.scanBarcode(
        '#004D40', 'Cancelar', true, ScanMode.QR);
    if (!mounted) {
      return;
    }
    setState(() {
// Set variables
      this._typeAheadController1.text = '';
      typeWashingListEmpty = null;
      _scanVq = '';
      _scanVi = '';
      _type = null;
      _reason = null;

// Validate QR value
      if (findVehicle(vehicle, uf)) {
        this._typeAheadController1.text = vehicle;
        typeWashingListEmpty = vehicle.contains(new RegExp(r"Z6[37]-4\d{3}$"))
            ? typeWashingListBuseton
            : vehicle.contains(new RegExp(r"Z6[37]-7\d{3}$"))
                ? typeWashingListPadron
                : null;
        _scanVq = vehicle;
        _scanVi = vehicle;
        _type = null;
        return _scanVq;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return errorProcessAlert("Bus NO identificado, por favor seleccione un vehículo de la unidad funcional ${uf_nam}");
          },
        );
      }
    });
  }

// Send Form
  void _submit(var size, bool force) async {
    fin();

    if (_scanVq.isEmpty || _scanVq == null) {
      showDialog(
        context: context,
        builder: (context) {
          return errorProcessAlert("Ingrese Código de Vehículo");
        },
      );
    } else {

      if (_type == null) {
        showDialog(
          context: context,
          builder: (context) {
            return errorProcessAlert("Ingrese Tipo");
          },
        );
      } else {

        var headers = {
          'Authorization': 'bearer ' + token,
          'Content-Type': 'application/json'
        };

        var body = json.encode({
          "vehicle": _scanVq,
          "id_service_type": _type.id,
          "id_reason": _reason == null ? 0 : _reason.id,
          "description": _observation,
          "force": force,
          "username": user
        });

        final response = await http.post(createWashing, headers: headers, body: body, encoding: Encoding.getByName("utf-8"));

        if (response.statusCode == 200) {
          // Execute endpoint
          EbResponseGeneral ebSerconConfirm = ebResponseGeneralFromJson(utf8.decode(response.bodyBytes));
          AwesomeDialog(
            context: context,
            dialogType: (ebSerconConfirm.valid)? DialogType.SUCCES: DialogType.WARNING,
            buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
            headerAnimationLoop: false,
            animType: AnimType.BOTTOMSLIDE,
            btnOkText: 'Cerrar',
            showCloseIcon: true,
            body: Column(
              children: <Widget>[
                Text(
                  ebSerconConfirm.message,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )..show();

          // Clean form
          if (ebSerconConfirm.valid) {
            setState(() {
              _scanVq = '';
              this._typeAheadController1.text = "";
              _observation = ' ';
              _type = null;
              _reason = null;
            });
          }
        } else {
          // dialogo conexion
        }
      }
    }
    fin();
  }
}
