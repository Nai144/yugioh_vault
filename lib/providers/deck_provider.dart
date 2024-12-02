import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yugioh_vault/models/deck.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';

class DeckProvider with ChangeNotifier {
  Deck _deck = Deck('My Deck');

  Deck get deck => _deck;

  // Método para cargar el mazo desde SharedPreferences
  Future<void> loadDeck() async {
    final prefs = await SharedPreferences.getInstance();
    final String? deckJson = prefs.getString('deck');
    
    if (deckJson != null) {
      _deck = Deck('My Deck');  // Inicializamos de nuevo el deck
      notifyListeners();
    }
  }

  // Método para guardar el mazo en SharedPreferences
  Future<void> saveDeck() async {
    final prefs = await SharedPreferences.getInstance();
    final String deckJson = json.encode(_deck.cards.map((card) => card.toJson()).toList());
    await prefs.setString('deck', deckJson);
  }

  // Método para añadir una carta al mazo
  void addCard(YugiohCard2 card) {
    bool success = _deck.addCard(card);
    if (success) {
      saveDeck(); // Guardamos el mazo cada vez que se añade una carta
      notifyListeners();
    } else {
      // Aquí podrías manejar el caso en que no se añade la carta
      print('No se pudo añadir la carta: máximo alcanzado o demasiadas copias');
    }
  }
}
