import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/yugioh_card.dart';

class YugiohApiService {
  final String baseUrl = 'https://db.ygoprodeck.com/api/v7';

  Future<List<YugiohCard>> fetchCards(String query) async {
  final response = await http.get(Uri.parse('$baseUrl/cardinfo.php?name=$query'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonBody = json.decode(response.body);

    // Accede a la clave "data" que contiene la lista de cartas
    if (jsonBody.containsKey('data')) {
      final List<dynamic> data = jsonBody['data'];

      return data.map((card) => YugiohCard.fromJson(card)).toList();
    } else {
      throw Exception('No cards found in the response');
    }
  } else {
    throw Exception('Failed to load cards');
  }
}

// Método para obtener todas las cartas
  Future<List<YugiohCard>> getAllCards() async {
    final response = await http.get(Uri.parse('$baseUrl/cardinfo.php'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener cartas');
    }
  }

  // Método para buscar una carta por nombre
  Future<Map<String, YugiohCard>> getCardByName(String name) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cardinfo.php?name=$name'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data[0]; // Devuelve la primera coincidencia
    } else {
      throw Exception('Error al buscar la carta por nombre');
    }
  }

  // Método para buscar cartas por tipo
  Future<List<YugiohCard>> getCardsByType(String type) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cardinfo.php?type=$type'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al buscar cartas por tipo');
    }
  }







  //=================================Metodos API REST=================================

// Método GET
  Future<List<YugiohCard>> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener datos');
    }
  }

  // Método POST
  Future<Map<String, YugiohCard>> postData(String endpoint, Map<String, YugiohCard> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al enviar datos');
    }
  }

  // Método PUT
  Future<Map<String, YugiohCard>> putData(String endpoint, Map<String, YugiohCard> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al actualizar datos');
    }
  }

  // Método DELETE
  Future<void> deleteData(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode != 204) {
      throw Exception('Error al eliminar datos');
    }
  }
}
