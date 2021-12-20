import 'package:flutter/material.dart';
import 'package:frontend_jm_alpaca/models/venta.dart';

import '../commondrawer.dart';
import 'package:frontend_jm_alpaca/globals.dart' as globals;

class Pesos extends StatefulWidget {
  static String ruta = "/pesos";

  @override
  State<StatefulWidget> createState() {
    return _Pesos();
  }
}

class _Pesos extends State<Pesos> {
  double totalPeso = 0;
  double totalCantidad = 0;
  double totalDescuento = 0;
  double totalSubtotal = 0;

  double precio = 0;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
        if (globals.listaVentas.length != 0) {
          mVenta nVenta = mVenta.fromValues(
              (globals.listaVentas.length + 1).toString(),
              globals.listaVentas[globals.listaVentas.length - 1].cliente,
              globals.listaVentas[globals.listaVentas.length - 1].vendedor,
              globals.listaVentas[globals.listaVentas.length - 1].transporte,
              globals.listaVentas[globals.listaVentas.length - 1].nfactura,
              globals.listaVentas[globals.listaVentas.length - 1].fechaFactura,
              globals.listaVentas[globals.listaVentas.length - 1].fechaVenta,
              "",
              "",
              0,
              0,
              0,
              0,
              0,
              false);

          globals.listaVentas.add(nVenta);

          Navigator.pushNamed(context, '/formPeso');
        } else {
          Navigator.pushNamed(context, '/venta');
        }
      } else if (_selectedIndex == 1) {
        guardarVenta();
        Navigator.pushNamed(context, '/detalleVentas');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesos"),
      ),
      drawer: CommonDrawer.obtenerDrawer(context),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildColumnaFija(),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: todo(),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Agregar Peso',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Guardar',
            backgroundColor: Colors.green,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> buildFijaTop() {
    List<Widget> list = <Widget>[];

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Peso"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Cantidad"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Descuento"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Precio"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Subtotal"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Opcion"),
    ));

    return list;
  }

  List<Widget> todo() {
    List<Widget> rows = <Widget>[];
    List<Widget> top = <Widget>[];

    top = buildFijaTop();

    rows.add(Row(
      children: top,
    ));

    totalPeso = 0;
    totalDescuento = 0;
    totalCantidad = 0;
    totalSubtotal = 0;

    for (int i = 0; i < globals.listaVentas.length; i++) {
      if (!globals.listaVentas[i].guardado) {
        rows.add(Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text("${globals.listaVentas[i].peso}"),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text("${globals.listaVentas[i].cantidad}"),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text("${globals.listaVentas[i].descuento}"),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text("${globals.listaVentas[i].precio}"),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text("${globals.listaVentas[i].subtotal}"),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontWeight: FontWeight.bold)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  onPressed: () {
                    _showMyDialog(globals.listaVentas[i],
                        globals.listaVentas[i].producto);
                    print("Registrar Precio");
                    print("tapped: ${globals.listaVentas[i].id}");
                  },
                  child: Icon(Icons.attach_money)),
            )
          ],
        ));
        totalPeso = totalPeso + globals.listaVentas[i].peso;
        totalCantidad = totalCantidad + globals.listaVentas[i].cantidad;
        totalDescuento = totalDescuento + globals.listaVentas[i].descuento;
        totalSubtotal = totalSubtotal + globals.listaVentas[i].subtotal;
      }
    }

    rows.add(Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("$totalPeso"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("$totalCantidad"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("$totalDescuento"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("Precio"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("$totalSubtotal"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("Opcion"),
        )
      ],
    ));

    return rows;
  }

  List<Widget> buildColumnaFija() {
    List<Widget> list = <Widget>[];

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Producto"),
    ));

    var listx = List.generate(
        globals.listaVentas.length,
        (index) => Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text(globals.listaVentas[index].producto),
            ));

    for (int i = 0; i < listx.length; i++) {
      if (!globals.listaVentas[i].guardado) {
        list.add(listx[i]);
      }
    }

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Total"),
    ));

    return list;
  }

  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        color: Colors.grey[700],
        margin: EdgeInsets.all(4.0),
        child: Text("${index + 1}", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(10),
      ),
    );
  }

  Future<void> _showMyDialog(mVenta venta, String nombreProducto) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrar Precio de $nombreProducto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      labelText: 'Precio',
                      hintText: "Precio",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) {
                      precio = double.parse(value!);
                      print(precio);
                    },
                    onChanged: (text) {
                      precio = double.parse(text);
                      print(text);
                    })
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                guardarPrecio(venta, precio);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future obtenerDetallesCompra() async {
    setState(() {
      globals.listaVentas = globals.listaVentas;
    });
  }

  Future guardarPrecio(mVenta venta, double precio) async {
    venta.precio = double.parse((precio).toStringAsFixed(2));
    venta.subtotal =
        double.parse((venta.peso * venta.precio).toStringAsFixed(2));
    obtenerDetallesCompra();
  }

  guardarVenta() {
    for (int i = 0; i < globals.listaVentas.length; i++) {
      globals.listaVentas[i].guardado = true;
    }
    VentaTotal ventaTotal = VentaTotal.fromValues(
        (globals.listaVentasTotales.length + 1).toString(),
        globals.listaVentas[globals.listaVentas.length - 1].cliente,
        globals.listaVentas[globals.listaVentas.length - 1].vendedor,
        globals.listaVentas[globals.listaVentas.length - 1].nfactura,
        totalSubtotal,
        globals.listaVentas[globals.listaVentas.length - 1].fechaVenta);

    globals.listaVentasTotales.add(ventaTotal);
  }
}
