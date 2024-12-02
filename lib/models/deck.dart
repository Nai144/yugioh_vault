import 'package:yugioh_vault/models/yugioh_card2.dart';

class Deck {
  final String name;
  final List<YugiohCard2> _cards = [];

  Deck(this.name);

  List<YugiohCard2> get cards => List.unmodifiable(_cards);

  bool addCard(YugiohCard2 card) {
    if (_cards.length >= 60) {
      return false; // No se pueden agregar más de 60 cartas
    }
    int cardCount = _cards.where((c) => c.id == card.id).length;
    if (cardCount >= 3) {
      return false; // No se permiten más de 3 copias de la misma carta
    }
    _cards.add(card);
    return true;
  }

  bool removeCard(YugiohCard2 card) {
    return _cards.remove(card);
  }

  int get cardCount => _cards.length;

  int cardCountById(int id) {
    return _cards.where((card) => card.id == id).length;
  }
}