import 'package:flutter/material.dart';
import 'package:yugioh_vault/screens/tendencies_screen.dart';

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