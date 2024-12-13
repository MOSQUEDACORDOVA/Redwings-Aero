import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = "https://back.dashboard.chatbot.mosquedacordova.com/api/login";

  // Método para autenticar al usuario
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Realizamos la solicitud HTTP POST con los parámetros email y password
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      // Comprobamos si la respuesta fue exitosa
      if (response.statusCode == 200) {
        // Si la autenticación es correcta, devolvemos los datos
        return json.decode(response.body);
      } else {
        // Si la autenticación falla, lanzamos un error
        throw Exception('Failed to authenticate user');
      }
    } catch (e) {
      // Manejo de excepciones
      throw Exception('Error during authentication: $e');
    }
  }
}
