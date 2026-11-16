import 'package:flutter/material.dart';

class Tela1Configuracao extends StatefulWidget {
  const Tela1Configuracao({super.key});

  @override
  State<Tela1Configuracao> createState() => _Tela1ConfiguracaoState();
}

class _Tela1ConfiguracaoState extends State<Tela1Configuracao> {
  // Controladores dos campos de entrada
  final nomeController = TextEditingController();
  final tripulantesController = TextEditingController();
  final distanciaController = TextEditingController();

  // Libera os controladores quando a tela é descartada
  @override
  void dispose() {
    nomeController.dispose();
    tripulantesController.dispose();
    distanciaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração da Missão'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Permite rolar a tela quando necessário
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Dados da Tripulação e Destino',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Nome do comandante
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Comandante',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Quantidade de tripulantes
            TextField(
              controller: tripulantesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade de Tripulantes',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Distância do destino
            TextField(
              controller: distanciaController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Distância em Anos-Luz',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
