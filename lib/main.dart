import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yugioh Vault',
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
        scaffoldBackgroundColor: Colors.black, // Fondo negro
        primaryColor: Colors.blueAccent, // Azul neón para elementos destacados
        textTheme: TextTheme(
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
      home: HomeScreen(), // Pantalla inicial
    );
  }
}