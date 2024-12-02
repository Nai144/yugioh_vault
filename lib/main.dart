import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_vault/screens/home_screen.dart';
import 'package:yugioh_vault/providers/deck_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeckProvider()..loadDeck(), // Cargar mazo al iniciar
      child: MaterialApp(
        title: 'Yugioh Vault',
        theme: ThemeData(
          brightness: Brightness.dark, // Tema oscuro
          scaffoldBackgroundColor: Colors.black, // Fondo negro
          primaryColor: Colors.blueAccent, // Azul neón para elementos destacados
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Color(0xFF00FFFF), // Azul neón para texto general
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              color: Color(0xFF00FFFF), // Azul neón para texto general
              fontSize: 16,
            ),
            headlineMedium: TextStyle(
              color: Color(0xFF00FFFF), // Azul neón para títulos
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const HomeScreen(), // Pantalla inicial
      ),
    );
  }
}