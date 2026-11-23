import 'package:flutter/material.dart';
import 'tela1_configuracao.dart';

class Tela4Relatorio extends StatelessWidget {
  // Dados da Tela 1
  final String nome;
  final int tripulantes;
  final double distancia;

  // Dados da Tela 2
  final int dias;
  final double precoCombustivel;
  final double combustivel;
  final double custoCombustivel;
  final double oxigenio;
  final double custoOxigenio;
  final double orcamentoNecessario;

  // Dados da Tela 3
  final double orcamentoDisponivel;
  final double saldoFinal;
  final double velocidadeMotor;
  final double desgasteMotor;

  const Tela4Relatorio({
    super.key,
    required this.nome,
    required this.tripulantes,
    required this.distancia,
    required this.dias,
    required this.precoCombustivel,
    required this.combustivel,
    required this.custoCombustivel,
    required this.oxigenio,
    required this.custoOxigenio,
    required this.orcamentoNecessario,
    required this.orcamentoDisponivel,
    required this.saldoFinal,
    required this.velocidadeMotor,
    required this.desgasteMotor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório Final da Missão'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Relatório Final da Missão',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // DADOS DA TRIPULAÇÃO
            const Text(
              'Tripulação e Destino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text('Comandante: $nome'),
            Text('Tripulantes: $tripulantes'),
            Text('Distância: $distancia anos-luz'),
            Text('Dias de viagem: $dias'),

            const SizedBox(height: 20),

            // RECURSOS E SUPRIMENTOS
            const Text(
              'Recursos e Suprimentos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text(
              'Combustível necessário: ${combustivel.toStringAsFixed(2)} kg',
            ),
            Text('Preço por kg: US\$ ${precoCombustivel.toStringAsFixed(2)}'),
            Text(
              'Custo do combustível: US\$ ${custoCombustivel.toStringAsFixed(2)}',
            ),
            Text('Oxigênio necessário: ${oxigenio.toStringAsFixed(2)} kg'),
            Text('Custo do oxigênio: US\$ ${custoOxigenio.toStringAsFixed(2)}'),

            const SizedBox(height: 20),

            // SITUAÇÃO FINANCEIRA
            const Text(
              'Situação Financeira',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text(
              'Orçamento necessário: US\$ '
              '${orcamentoNecessario.toStringAsFixed(2)}',
            ),

            Text(
              'Orçamento disponível: US\$ '
              '${orcamentoDisponivel.toStringAsFixed(2)}',
            ),

            Text(
              'Saldo final: US\$ ${saldoFinal.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: saldoFinal < 0 ? Colors.red : Colors.green,
              ),
            ),

            if (saldoFinal < 0)
              const Text(
                'RISCO CRÍTICO: Falência financeira da missão!',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 20),

            // RISCOS DOS MOTORES
            const Text(
              'Riscos e Motores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text('Velocidade dos motores: ${velocidadeMotor.toInt()}%'),
            Text('Desgaste dos motores: ${desgasteMotor.toStringAsFixed(2)}'),

            if (velocidadeMotor > 80)
              const Text(
                'ALERTA: Possível pane nos motores!',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Tela1Configuracao(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Reiniciar Missão'),
            ),
          ],
        ),
      ),
    );
  }
}
