import 'package:flutter/material.dart';

class Tela2Recursos extends StatefulWidget {
  // Dados recebidos da Tela 1
  final String nome;
  final int tripulantes;
  final double distancia;

  const Tela2Recursos({
    super.key,
    required this.nome,
    required this.tripulantes,
    required this.distancia,
  });

  @override
  State<Tela2Recursos> createState() => _Tela2RecursosState();
}

class _Tela2RecursosState extends State<Tela2Recursos> {
  // Controladores dos campos da Tela 2
  final diasController = TextEditingController();
  final custoCombustivelController = TextEditingController();

  @override
  void dispose() {
    diasController.dispose();
    custoCombustivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recursos e Suprimentos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Recursos e Suprimentos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Dados recebidos da Tela 1
            Text('Comandante: ${widget.nome}'),
            Text('Tripulantes: ${widget.tripulantes}'),
            Text('Distância: ${widget.distancia} anos-luz'),

            const SizedBox(height: 25),

            // Dias estimados da viagem
            TextField(
              controller: diasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Dias estimados para a viagem',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Custo do combustível por quilo
            TextField(
              controller: custoCombustivelController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Custo do combustível por kg (US\$)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
