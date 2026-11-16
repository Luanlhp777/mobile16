import 'package:flutter/material.dart';
import 'tela1_configuracao.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simulador de Missão Intergaláctica',
      home: Tela1Configuracao(),
    );
  }
}
