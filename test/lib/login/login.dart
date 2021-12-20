import 'package:flutter/material.dart';
import 'package:frontend_jm_alpaca/models/login.dart';
import 'package:frontend_jm_alpaca/providers/login.dart';

import 'package:frontend_jm_alpaca/globals.dart' as globals;

class Login extends StatefulWidget {
  static String ruta = "/login";

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String usuarioIngresado = "";
  String contrasenaIngresada = "";

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
                Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Usuario',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            onSaved: (value) {
                              usuarioIngresado = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                            onSaved: (value) {
                              contrasenaIngresada = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                                // if (formKey.currentState!.validate()) {
                                //   formKey.currentState!.save();
                                //   validarToken(
                                //       usuarioIngresado, contrasenaIngresada);
                                // }
                              },
                              color: Colors.cyan,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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

  void validarToken(String usuario, String contrasena) async {
    AuthProvider ap = AuthProvider();
    AuthResponse ar =
        await ap.obtenerToken(usuarioIngresado, contrasenaIngresada);

    if (ar.message != "Usuario autenticado") {
      print("Fail :(");
    } else {
      print("Login Exitoso :D");

      formKey.currentState!.reset();

      globals.usuarioActualId = ar.usuarioId;

      print(ar.message);
      print(ar.usuarioId);
      print(ar.token);

      //Navigator.pushNamed(context, '/home');
    }
  }
}
