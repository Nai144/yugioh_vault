import 'package:flutter/material.dart';
import '../models/yugioh_card.dart';
import '../services/yugioh_api_service.dart';

class CardProvider with ChangeNotifier {
  List<YugiohCard> _cards = [];
  bool _isLoading = false;

  List<YugiohCard> get cards => _cards;
  bool get isLoading => _isLoading;

  final YugiohApiService _apiService = YugiohApiService();

  Future<void> searchCards(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _cards = await _apiService.fetchCards(query);
    } catch (e) {
      print('Error fetching cards: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  //Devuelve todas las cartas
  Future<void> fetchAllCards() async {
  _isLoading = true;
  notifyListeners();

  try {
    _cards = await _apiService.getAllCards();
  } catch (e) {
    print('Error fetching all cards: $e');
    _cards = [];
  }

  _isLoading = false;
  notifyListeners();
}

//Devuelve una carta por nombre
Future<YugiohCard?> fetchCardByName(String name) async {
  try {
    final Map<String, YugiohCard> cardMap = await _apiService.getCardByName(name);
    return cardMap[name];
  } catch (e) {
    print('Error fetching card by name: $e');
    return null;
  }
}

//Devuelve cartas por tipo
Future<void> fetchCardsByType(String type) async {
  _isLoading = true;
  notifyListeners();

  try {
    _cards = await _apiService.getCardsByType(type);
  } catch (e) {
    print('Error fetching cards by type: $e');
    _cards = [];
  }

  _isLoading = false;
  notifyListeners();
}
}