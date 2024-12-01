import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yugioh_vault/models/yugioh_card2.dart';
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
  Future<List<YugiohCard>> getAllBlueEyesCards() async {
    
  final response = await http
    .get(Uri.parse('$baseUrl/cardinfo.php?archetype=Blue-Eyes'))
    .timeout(Duration(seconds: 30), onTimeout: () {
  throw Exception('Tiempo de espera agotado');
});
  print("Respuesta completa: ${response.body}");

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);

      if (jsonBody.containsKey('data')) {
        final List<dynamic> data = jsonBody['data'];

        print("Contenido de data: $data");

        return data.map((cardJson) {
          if (cardJson is Map<String, dynamic>) {
            return YugiohCard.fromJson(cardJson);
          } else {
            throw Exception('Formato incorrecto para un elemento de data: $cardJson');
          }
        }).toList();
      } else {
        throw Exception('La clave "data" no está presente en la respuesta.');
      }
    } else {
      throw Exception('Error al obtener las cartas. Código de estado: ${response.statusCode}');
    }
  } 

  // Método para buscar una carta por nombre
  Future<YugiohCard?> getCardByName(String name) async {
    final response =
        await http.get(Uri.parse('$baseUrl/cardinfo.php?name=$name'));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> data = jsonBody['data'];
      return data.isNotEmpty ? YugiohCard.fromJson(data.first) : null;
    } else {
      throw Exception('Error al buscar carta por nombre');
    }
  }
  Future<List<YugiohCard2>> getTrendingCards() async {
    final response = await http.get(Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php?archetype=Blue-Eyes'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Verificar que la clave 'data' existe y contiene una lista
      if (data['data'] != null && data['data'] is List) {
        return (data['data'] as List)
            .map((json) => YugiohCard2.fromJson(json))
            .toList();
      } else {
        throw Exception('El formato de datos de la API no es válido');
      }
    } else {
      throw Exception('Error al obtener las cartas: ${response.reasonPhrase}');
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
