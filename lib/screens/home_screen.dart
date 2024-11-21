import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_vault/screens/deck_Screen.dart';
import 'package:yugioh_vault/screens/tendencies_screen.dart';

import '../widgets/card_item.dart';


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
    WelcomeScreen(), // Pantalla 2: Favoritos
    DeckScreen(), // Pantalla 3: Configuración
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

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body:Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TendenciasScreen()),
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
                        MaterialPageRoute(builder: (context) => const TendenciasScreen()),
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
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                              child: Text('Busqueda Avanzada',
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
                        MaterialPageRoute(builder: (context) => const TendenciasScreen()),
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

