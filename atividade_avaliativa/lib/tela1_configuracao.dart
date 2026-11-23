import 'package:flutter/material.dart';
import 'tela2_recursos.dart';

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

  // Validação dos dados da missão
  void validarDados() {
    String nome = nomeController.text.trim();

    int? tripulantes = int.tryParse(tripulantesController.text.trim());

    double? distancia = double.tryParse(
      distanciaController.text.trim().replaceAll(',', '.'),
    );

    // Verifica o nome do comandante
    if (nome.isEmpty) {
      mostrarErro('Informe o nome do comandante.');
      return;
    }

    // Verifica a quantidade de tripulantes
    if (tripulantes == null || tripulantes <= 0) {
      mostrarErro('Informe uma quantidade válida de tripulantes.');
      return;
    }

    // Verifica a distância
    if (distancia == null || !distancia.isFinite || distancia <= 0) {
      mostrarErro('Informe uma distância válida.');
      return;
    }

    // Dados válidos: abre a Tela 2
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela2Recursos(
          nome: nome,
          tripulantes: tripulantes,
          distancia: distancia,
        ),
      ),
    );
  }

  // Exibe mensagens de erro
  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem), backgroundColor: Colors.red),
    );
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

            const SizedBox(height: 25),

            // Botão para validar os dados da missão
            ElevatedButton(
              onPressed: () {
                validarDados();
              },
              child: const Text('Avançar para Recursos'),
            ),
          ],
        ),
      ),
    );
  }
}
