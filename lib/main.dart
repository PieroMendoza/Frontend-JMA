import 'package:flutter/material.dart';
import 'package:frontend_jm_alpaca/detalle_ventas/detalle_ventas.dart';
import 'package:frontend_jm_alpaca/login/login.dart';
import 'package:frontend_jm_alpaca/venta/form_peso.dart';
import 'package:frontend_jm_alpaca/venta/pesos.dart';
import 'package:frontend_jm_alpaca/venta/venta.dart';

import 'firstpage/firstpage.dart';
import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Color.fromRGBO(16, 228, 236, 1)),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routes: {
          FirstPage.ruta: (BuildContext context) => FirstPage(),
          Login.ruta: (BuildContext context) => Login(),
          Home.ruta: (BuildContext context) => Home(),
          Venta.ruta: (BuildContext context) => Venta(),
          DetalleVentas.ruta: (BuildContext context) => DetalleVentas(),
          Pesos.ruta: (BuildContext context) => Pesos(),
          FormPeso.ruta: (BuildContext context) => FormPeso(),
        });
  }
}
