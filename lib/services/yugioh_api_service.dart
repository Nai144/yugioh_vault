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
}