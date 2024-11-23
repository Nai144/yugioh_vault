import 'package:flutter/material.dart';
import 'package:yugioh_vault/screens/deck_Screen.dart';
import 'package:yugioh_vault/screens/tendencies_screen.dart';
import 'package:yugioh_vault/screens/welcome_screen.dart';
//
//import '../widgets/card_item.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  // Lista de pantallas
  final List<Widget> _screens = [
    const TendenciasScreen(), // Pantalla 1: Listado de cartas
    const WelcomeScreen(), // Pantalla 2: Favoritos
    const DeckScreen(), // Pantalla 3: Configuración
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Tendencia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Decks',
          ),
        ],
        
        )
      );
  }
}