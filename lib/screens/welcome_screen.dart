import 'package:flutter/material.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'package:yugioh_vault/screens/card_detail_screen.dart';
import 'package:yugioh_vault/screens/last_cardset.dart';
import 'package:yugioh_vault/screens/lista_tendencias_screen.dart';
import 'package:yugioh_vault/screens/tendencies_screen.dart';
import 'package:yugioh_vault/services/yugioh_api_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {

  final YugiohApiService _apiService = YugiohApiService();
  bool _isLoading = false;

  void _searchCard(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true; // Mostrar indicador de carga
    });

    try {
      final YugiohCard2? card = await _apiService.getCardByName(query);
      setState(() {
        _isLoading = false; // Ocultar indicador de carga
      });

      if (card != null) {
        // Navegar a la pantalla de detalles
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => CardDetailScreen(card: card),
          ),
        );
      } else {
        // Mostrar alerta si no se encuentra la carta
        _showAlertDialog('Card Not Found', 'No card matches your search query.');
      }
    } catch (e) {
      setState(() {
        _isLoading = false; // Ocultar indicador de carga
      });
      _showAlertDialog('Error', 'Failed to fetch card data. Please try again.');
    }
  }
  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards'),
      backgroundColor: Colors.deepPurple,
      ),
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                 onSubmitted: _searchCard, // Llamar a _searchCard al presionar "Enter"
              ),
            ),
            const SizedBox(height: 16.0),
            // Mostrar indicador de carga
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LastCardsetScreen()),
                  );
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 180.0,
                        decoration: BoxDecoration(
                          borderRadius: 
                          BorderRadius.circular(10),

                        ),
                        child: Image.network(
                              'https://down-my.img.susercontent.com/file/my-11134202-7r98u-lo6mj97nrqbqde',
                              fit: BoxFit.contain,
                            ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                          child: Text('Ultima Coleccion',
                            style: TextStyle(
                              fontSize: 18,    
                            ),
                          ),
                        ),
                    ],
                  )
                ),
              )
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListaTendenciasScreen(
                            pathOfArchetype:'lib/assets/json/Most_Used_Cards.json',
                          ),
                        ),
                      );
                    },                    
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: 
                              BorderRadius.circular(10),

                            ),
                            child: Image.network(
                              'https://images.ygoprodeck.com/images/cards_cropped/10045474.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                              child: Text('Cartas más utilizadas',
                                style: TextStyle(
                                  fontSize: 18,    
                                ),
                              ),
                            ),
                        ],
                      )
                    ),
                  )
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListaTendenciasScreen(
                            pathOfArchetype:'lib/assets/json/Banlist.json',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: 
                              BorderRadius.circular(10),

                            ),
                            child: Image.network(
                              'https://images.ygoprodeck.com/images/cards_cropped/55144522.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                              child: Text('Banlist',
                                style: TextStyle(
                                  fontSize: 18,    
                                ),
                              ),
                            ),
                        ],
                      )
                    ),
                  )
                )
              ],
            ) 
          ],
        ),
      ),
    );
  }
}