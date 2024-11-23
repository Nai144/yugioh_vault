import 'package:flutter/material.dart';
import 'package:yugioh_vault/providers/card_provider.dart';
import 'package:yugioh_vault/screens/tendencies_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body:Container(
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
                onChanged: (value) {
                  // Aquí puedes agregar la lógica para filtrar los resultados
                  if (value.isNotEmpty) {
                    // Realizamos la búsqueda solo si el valor no está vacío
                    Provider.of<CardProvider>(context, listen: false).fetchCardByName(value);
                  } else {
                    // Si el campo está vacío, puedes decidir qué hacer (por ejemplo, limpiar los resultados)
                    Provider.of<CardProvider>(context, listen: false).fetchAllCards();
                  }
                },
              ),
            ),
            const SizedBox(height: 16.0),
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