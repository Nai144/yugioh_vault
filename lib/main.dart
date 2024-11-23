import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}