// ======================================================
// APP EVENTOS 911
// Nombre: Ramsés Ambiorix Arnó Rosario
// Matrícula: 2024-0078
// ======================================================

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventos 911',
      home: HomeScreen(),
    );
  }
}