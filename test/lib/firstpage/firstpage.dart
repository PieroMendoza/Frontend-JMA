import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  static String ruta = "/";

  @override
  State<StatefulWidget> createState() {
    return _FirstPage();
  }
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  child: Stack(
                    children: <Widget>[
                      Text(
                        'JM. ALPACA',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 60.0,
                            color: Colors.cyan),
                      ),
                      Divider(
                        color: Colors.cyan,
                        height: 180,
                        thickness: 5,
                      ),
                      Positioned(
                        height: 100,
                        width: 300,
                        right: 25,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/pasto.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Positioned(
                        height: 300,
                        width: 350,
                        bottom: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/alpaca.png'),
                                  fit: BoxFit.scaleDown)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () => {Navigator.pushNamed(context, '/login')},
                    color: Colors.grey,
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
