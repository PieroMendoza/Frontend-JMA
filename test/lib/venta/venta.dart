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

class Venta extends StatefulWidget {
  static String ruta = "/venta";

  @override
  State<StatefulWidget> createState() {
    return _Venta();
  }
}

class _Venta extends State<Venta> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombres = "";
  String apellidos = "";
  String pais = "Seleccione el País";
  String dni = "";
  String departamento = "";
  String provincia = "";
  String tipoCalle = "";
  String nombreCalle = "";
  String celular = "";
  String fecha = "";
  String usuarioId = "";

  @override
  void initState() {
    super.initState();
    obtenerPaisesList();
    print("Dropdowns cargados.");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva Venta"),
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
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nombres',
                              hintText: "Ingrese sus nombres",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (newValue) {
                              nombres = newValue!;
                            },
                            onChanged: (text) {
                              nombres = text;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Apellidos',
                              hintText: "Ingrese sus apellidos",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (newValue) {
                              apellidos = newValue!;
                            },
                            onChanged: (text) {
                              apellidos = text;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 60,
                                    child: InputDecorator(
                                      decoration: const InputDecoration(
                                          labelText: "País",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 0.7),
                                          ),
                                          border: OutlineInputBorder()),
                                      child: DropdownButtonHideUnderline(
                                          child: getPais()),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(child: getDni())
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Departamento',
                              hintText: "Ingrese el departamento",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (newValue) {
                              departamento = newValue!;
                            },
                            onChanged: (text) {
                              departamento = text;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Provincia',
                              hintText: "Ingrese la provincia",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (newValue) {
                              provincia = newValue!;
                            },
                            onChanged: (text) {
                              provincia = text;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(child: getTipoCalle()),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(child: getNombreCalle())
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          getCelular(),
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

                                    guardarVenta();
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

  DropdownButton getPais() {
    return DropdownButton<String>(
        isExpanded: true,
        value: pais,
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
            pais = newValue!;
          });
        },
        items:
            globals.listaPaises.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  TextFormField getDni() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'DNI',
        hintText: "Ingrese su DNI",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        dni = value!;
      },
      onChanged: (text) {
        dni = text;
        print(dni);
      },
    );
  }

  TextFormField getTipoCalle() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Tipo Calle',
        hintText: "Ingrese el tipo de calle",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        tipoCalle = value!;
      },
      onChanged: (text) {
        tipoCalle = text;
      },
    );
  }

  TextFormField getNombreCalle() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Nombre de Calle',
        hintText: "Ingrese el nombre de calle",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        nombreCalle = value!;
      },
      onChanged: (text) {
        nombreCalle = text;
      },
    );
  }

  TextFormField getCelular() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Celular',
        hintText: "Ingrese el celular",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        celular = value!;
      },
      onChanged: (text) {
        celular = text;
      },
    );
  }

  Future obtenerPaisesList() async {
    PaisesProvider pp = PaisesProvider();

    List<PaisModel> pr = await pp.obtenerPaises();

    setState(() {
      if (globals.listaPaises.isEmpty) {
        globals.listaPaises.add("Seleccione el País");
        for (int i = 0; i < pr.length; i++) {
          globals.listaPaises.add(pr[i].nombre);
          print("Paiscito: ${globals.listaPaises[i]}");
        }
      }
    });
  }

  guardarVenta() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    fecha = formattedDate;

    VentaModel venta = VentaModel.fromValues(
        "",
        nombres,
        apellidos,
        pais,
        dni,
        departamento,
        provincia,
        tipoCalle,
        nombreCalle,
        celular,
        fecha,
        globals.usuarioActualId);

    VentaProvider vp = VentaProvider();

    CreateVentaResponse cvr = await vp.createVenta(venta);
  }
}
