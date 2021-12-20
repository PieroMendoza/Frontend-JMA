import 'dart:convert';

class AuthResponse {
  String message = "";
  String usuarioId = "";
  String? token = "";

  AuthResponse(Map jsonAuthResponse) {
    this.message = jsonAuthResponse["message"];
    this.usuarioId = jsonAuthResponse["usuarioId"];
    this.token = jsonAuthResponse["token"];
  }
}
