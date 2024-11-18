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
}