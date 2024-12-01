import 'package:flutter/material.dart';
import '../models/yugioh_card.dart';
import '../services/yugioh_api_service.dart';

class CardProvider with ChangeNotifier {
  List<YugiohCard> _cards = [];
  bool _isLoading = false;

  List<YugiohCard> get cards => _cards;
  bool get isLoading => _isLoading;

  final YugiohApiService _apiService = YugiohApiService();

  // Método para buscar cartas por nombre
  Future<void> searchCards(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _cards = await _apiService.fetchCards(query);
    } catch (e) {
      print('Error fetching cards: $e');
      _cards = []; // Limpia la lista en caso de error
    }

    _isLoading = false;
    notifyListeners();
  }

  // Devuelve todas las cartas
  Future<void> fetchAllCards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cards = await _apiService.getAllBlueEyesCards();
    } catch (e) {
      print('Error fetching all cards: $e');
      _cards = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  // Devuelve una carta por nombre
  Future<void> fetchCardByName(String name) async {
    _isLoading = true;
    notifyListeners();

    try {
      final YugiohCard? card = await _apiService.getCardByName(name);
      if (card != null) {
        _cards = [card]; // Se asigna un solo objeto YugiohCard
      } else {
        _cards = [];
      }
    } catch (e) {
      print('Error fetching card by name: $e');
      _cards = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  // Devuelve cartas por tipo
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