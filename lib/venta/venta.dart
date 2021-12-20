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

  String cliente = "Seleccione Cliente";
  String vendedor = "Seleccione Vendedor";
  String transporte = "Seleccione Transporte";
  String nfactura = "";

  DateTime fechaFactura = DateTime.now();
  DateTime fechaVenta = DateTime.now();
  String fechaFacturaLabel = "";
  String fechaVentaLabel = "";

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
                          Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  labelText: "Cliente",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                  child: getCliente()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  labelText: "Vendedor",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                  child: getVendedor()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  labelText: "Transporte",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                  child: getTransporte()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          getNFactura(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(child: getFechaLabelFactura()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 40,
                                      child: Center(
                                        child: getFechaFactura(),
                                      ),
                                    ),
                                    fit: FlexFit.loose,
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(child: getFechaLabelVenta()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 50,
                                      child: Center(
                                        child: getFechaVenta(),
                                      ),
                                    ),
                                    fit: FlexFit.loose,
                                  )
                                ],
                              )),
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

  //Dialog Fechas

  selectFechaFactura(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: fechaFactura,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (selected != null && selected != fechaFactura)
      setState(() {
        fechaFactura = selected;
      });
  }

  selectFechaVenta(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: fechaVenta,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (selected != null && selected != fechaVenta)
      setState(() {
        fechaVenta = selected;
      });
  }

  //////

  DropdownButton getCliente() {
    return DropdownButton<String>(
        isExpanded: true,
        value: cliente,
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
            cliente = newValue!;
          });
        },
        items: ['Seleccione Cliente', 'Michell', 'Ronald']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  DropdownButton getVendedor() {
    return DropdownButton<String>(
        isExpanded: true,
        value: vendedor,
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
            vendedor = newValue!;
          });
        },
        items: ['Seleccione Vendedor', 'Jacinto', 'Terry']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  DropdownButton getTransporte() {
    return DropdownButton<String>(
        isExpanded: true,
        value: transporte,
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
            transporte = newValue!;
          });
        },
        items: [
          'Seleccione Transporte',
          'Id. 76 Cantidad 33',
          'Id. 70 Cantidad 174'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
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

  TextFormField getNFactura() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'N° Factura',
        hintText: "Ingrese el N° Factura",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        nfactura = value!;
      },
      onChanged: (text) {
        nfactura = text;
      },
    );
  }

  TextFormField getFechaLabelFactura() {
    return TextFormField(
      enabled: false,
      controller: TextEditingController(
          text:
              "${fechaFactura.day}/${fechaFactura.month}/${fechaFactura.year}"),
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        labelText: 'Fecha Factura',
        hintText: "DD/MM/AAAA",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        fechaFacturaLabel = value!;
      },
    );
  }

  TextButton getFechaFactura() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromRGBO(49, 39, 79, 1);
    }

    return TextButton.icon(
        icon: Icon(
          TablerIcons.calendar,
          color: Colors.black,
        ),
        label: Text("Fecha Factura",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(getColor),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          selectFechaFactura(context);
          print(fechaFactura.day);
        });
  }

  TextFormField getFechaLabelVenta() {
    return TextFormField(
      enabled: false,
      controller: TextEditingController(
          text: "${fechaVenta.day}/${fechaVenta.month}/${fechaVenta.year}"),
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        labelText: 'Fecha Venta',
        hintText: "DD/MM/AAAA",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        fechaVentaLabel = value!;
      },
    );
  }

  TextButton getFechaVenta() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromRGBO(49, 39, 79, 1);
    }

    return TextButton.icon(
        icon: Icon(
          TablerIcons.calendar,
          color: Colors.black,
        ),
        label: Text("Fecha Venta",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(getColor),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          selectFechaVenta(context);
          print(fechaVenta.day);
        });
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

  save() {
    mVenta nVenta = mVenta.fromValues(
        (globals.listaVentas.length + 1).toString(),
        cliente,
        vendedor,
        transporte,
        nfactura,
        fechaFacturaLabel,
        fechaVentaLabel,
        "",
        "",
        0,
        0,
        0,
        0,
        0,
        false);

    globals.listaVentas.add(nVenta);
    print(globals.listaVentas[globals.listaVentas.length - 1].id);
    Navigator.pushNamed(context, '/formPeso');
  }
}
