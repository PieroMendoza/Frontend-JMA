// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend_jm_alpaca/commondrawer.dart';
import 'package:frontend_jm_alpaca/models/home.dart';
import 'package:frontend_jm_alpaca/providers/home.dart';

class Home extends StatefulWidget {
  static String ruta = "/home";

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombres = "";
  String apellidos = "";
  String pais = "Seleccione el País";
  String dni = "";
  String departamento = "";
  String provincia = "";
  String tipoCalle = "";
  String nombreCalle = "";
  String numeroCalle = "";
  String fechaId = "";
  String usuarioId = "";

  static List<String> listaPaises = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: CommonDrawer.obtenerDrawer(context),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                height: 350,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      height: 340,
                      width: 320,
                      right: 30,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/alpaca2.png'),
                                fit: BoxFit.scaleDown)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: Text(
                    'Comprar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
