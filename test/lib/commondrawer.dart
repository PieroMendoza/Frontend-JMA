import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter/material.dart';

import 'package:frontend_jm_alpaca/firstpage/firstpage.dart';
import 'package:frontend_jm_alpaca/login/login.dart';
import 'package:frontend_jm_alpaca/home/home.dart';
import 'package:frontend_jm_alpaca/venta/venta.dart';

class CommonDrawer {
  static ListTile obtenerElemento(
      Icon icono, String nombre, String ruta, BuildContext bContext) {
    return ListTile(
      leading: icono,
      title: Text(
        nombre,
        style: TextStyle(fontSize: 15),
      ),
      onTap: () {
        Navigator.pushNamed(bContext, ruta);
      },
    );
  }

  static Drawer obtenerDrawer(BuildContext contexto) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Eduardo Arce"),
            accountEmail: Text("eduardoarce@upeu.edu.pe"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/alpaca.png'),
                    fit: BoxFit.cover)),
          ),
          obtenerElemento(Icon(TablerIcons.home), "Home", Home.ruta, contexto),
          obtenerElemento(
              Icon(TablerIcons.report_money), "Venta", Venta.ruta, contexto),
        ],
      ),
    );
  }
}
