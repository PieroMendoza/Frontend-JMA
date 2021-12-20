import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:frontend_jm_alpaca/commondrawer.dart';
import 'package:frontend_jm_alpaca/models/home.dart';
import 'package:frontend_jm_alpaca/models/login.dart';
import 'package:frontend_jm_alpaca/models/venta.dart';
import 'package:frontend_jm_alpaca/providers/home.dart';
import 'package:frontend_jm_alpaca/providers/login.dart';
import 'package:frontend_jm_alpaca/providers/venta.dart';
import 'package:intl/intl.dart';
import '../globals.dart' as globals;

class FormPeso extends StatefulWidget {
  static String ruta = "/formPeso";

  @override
  State<StatefulWidget> createState() {
    return _FormPeso();
  }
}

class _FormPeso extends State<FormPeso> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String producto = "Seleccione Producto";
  String tipoDescuento = "Seleccione Tipo Descuento";
  double cantidad = 0;
  double peso = 0;
  double descuento = 0;

  TextEditingController cDescuento = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Peso"),
      ),
      drawer: CommonDrawer.obtenerDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  labelText: "Producto",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                  child: getProducto()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  labelText: "Tipo Descuento",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                  child: getTipoDescuento()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          getCantidad(),
                          SizedBox(
                            height: 20,
                          ),
                          getPeso(),
                          SizedBox(
                            height: 20,
                          ),
                          getDescuento(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 60,
                              padding: EdgeInsets.all(10),
                              child: ElevatedButton(
                                child: Text(
                                  "Continuar",
                                  style: TextStyle(fontSize: 16),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    save();

                                    //guardarVenta();
                                  }
                                },
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownButton getProducto() {
    return DropdownButton<String>(
        isExpanded: true,
        value: producto,
        icon: const Icon(TablerIcons.chevron_down),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String? newValue) {
          setState(() {
            producto = newValue!;
          });
        },
        items: [
          'Seleccione Producto',
          'Huacayo Blanco',
          'Huacayo Color',
          'Suri Blanco',
          'Suri Color',
          'Cuero Huacayo Blanco',
          'Cuero Huacayo Color'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  DropdownButton getTipoDescuento() {
    return DropdownButton<String>(
        isExpanded: true,
        value: tipoDescuento,
        icon: const Icon(TablerIcons.chevron_down),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String? newValue) {
          setState(() {
            tipoDescuento = newValue!;
          });
        },
        items: [
          'Seleccione Tipo Descuento',
          'Manta(s)',
          'Yute(s)',
          'Cuero',
          'Otro'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  TextFormField getCantidad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Cantidad',
        hintText: "Ingrese la cantidad",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        cantidad = double.parse(value!);
      },
      onChanged: (text) {
        print(text);
        if (text == "") {
          cDescuento.text = "0";
        } else {
          cDescuento.text = (double.parse(text) * 2).toString();
        }
      },
    );
  }

  TextFormField getPeso() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Peso',
        hintText: "Ingrese el Peso",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        peso = double.parse(value!);
      },
    );
  }

  TextFormField getDescuento() {
    return TextFormField(
      enabled: false,
      controller: cDescuento,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        labelText: 'Descuento',
        hintText: "Descuento",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        descuento = double.parse(value!);
      },
    );
  }

  save() {
    globals.listaVentas[globals.listaVentas.length - 1].producto = producto;
    globals.listaVentas[globals.listaVentas.length - 1].tipoDescuento =
        tipoDescuento;
    globals.listaVentas[globals.listaVentas.length - 1].cantidad = cantidad;
    globals.listaVentas[globals.listaVentas.length - 1].peso = peso;
    globals.listaVentas[globals.listaVentas.length - 1].descuento = descuento;

    Navigator.pushNamed(context, '/pesos');
  }
}
