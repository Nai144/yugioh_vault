import 'package:flutter/material.dart';
import 'package:yugioh_vault/screens/deck_Screen.dart';
import 'package:yugioh_vault/screens/tendencies_screen.dart';
import 'package:yugioh_vault/screens/welcome_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  bool _isConnected = true;

  // Lista de pantallas
  final List<Widget> _screens = [
    const TendenciasScreen(), // Pantalla 1: Listado de cartas
    const WelcomeScreen(), // Pantalla 2: Favoritos
    const DeckScreen(), // Pantalla 3: Configuración
  ];

 @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  void _checkConnectivity() async {
  final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
  for (var result in results) {
    _updateConnectionStatus(result);
  }

  Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
    for (var result in results) {
      _updateConnectionStatus(result);
    }
  });
}
  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isConnected
          ? _screens[_currentIndex] // Muestra la pantalla seleccionada
          : const Center(
              child: Text(
                'Es necesario tener conexión a Internet',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Decks',
          ),
        ],
      ),
    );
  }
}