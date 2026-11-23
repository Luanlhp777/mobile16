import 'package:flutter/material.dart';
import 'tela3_riscos.dart';

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
  // Resultados dos cálculos
  double combustivelCalculado = 0;
  double custoCombustivelCalculado = 0;
  double oxigenioCalculado = 0;
  double custoOxigenioCalculado = 0;
  double orcamentoCalculado = 0;

  bool calculoRealizado = false;

  @override
  void dispose() {
    diasController.dispose();
    custoCombustivelController.dispose();
    super.dispose();
  }

  // Calcula os recursos necessários para a missão
  void calcularRecursos() {
    int? dias = int.tryParse(diasController.text.trim());

    double? precoCombustivel = double.tryParse(
      custoCombustivelController.text.trim().replaceAll(',', '.'),
    );

    // Validação dos dias
    if (dias == null || dias <= 0) {
      mostrarErro('Informe uma quantidade válida de dias.');
      return;
    }

    // Validação do preço do combustível
    if (precoCombustivel == null ||
        !precoCombustivel.isFinite ||
        precoCombustivel <= 0) {
      mostrarErro('Informe um preço válido para o combustível.');
      return;
    }

    // Quantidade de combustível necessária (kg)
    double combustivel = widget.distancia * widget.tripulantes * 1000;

    // Custo total do combustível
    double custoTotalCombustivel = combustivel * precoCombustivel;

    // Quantidade de oxigênio necessária (kg)
    double oxigenio = widget.tripulantes * dias * 2.5;

    // Custo total do oxigênio
    double custoOxigenio = oxigenio * 50;

    // Orçamento total necessário
    double orcamentoNecessario = custoTotalCombustivel + custoOxigenio;

    setState(() {
      combustivelCalculado = combustivel;
      custoCombustivelCalculado = custoTotalCombustivel;
      oxigenioCalculado = oxigenio;
      custoOxigenioCalculado = custoOxigenio;
      orcamentoCalculado = orcamentoNecessario;

      calculoRealizado = true;
    });

    // Resultado temporário para conferência
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Orçamento necessário: US\$ '
          '${orcamentoNecessario.toStringAsFixed(2)}',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Exibe mensagens de erro
  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem), backgroundColor: Colors.red),
    );
  }

  // Avança para a Tela 3 com os dados da missão
  void avancarParaRiscos() {
    // Garante que os cálculos foram realizados
    if (!calculoRealizado) {
      mostrarErro('Calcule os recursos antes de avançar.');
      return;
    }

    int? dias = int.tryParse(diasController.text.trim());

    double? precoCombustivel = double.tryParse(
      custoCombustivelController.text.trim().replaceAll(',', '.'),
    );

    // Confere os valores antes de enviar
    if (dias == null ||
        dias <= 0 ||
        precoCombustivel == null ||
        !precoCombustivel.isFinite ||
        precoCombustivel <= 0) {
      mostrarErro('Verifique os dados da viagem.');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela3Riscos(
          nome: widget.nome,
          tripulantes: widget.tripulantes,
          distancia: widget.distancia,
          dias: dias,
          precoCombustivel: precoCombustivel,
          combustivel: combustivelCalculado,
          custoCombustivel: custoCombustivelCalculado,
          oxigenio: oxigenioCalculado,
          custoOxigenio: custoOxigenioCalculado,
          orcamentoNecessario: orcamentoCalculado,
        ),
      ),
    );
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
              onChanged: (valor) {
                setState(() {
                  calculoRealizado = false;
                });
              },
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
              onChanged: (valor) {
                setState(() {
                  calculoRealizado = false;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Custo do combustível por kg (US\$)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // Botão para calcular os recursos da missão
            ElevatedButton(
              onPressed: () {
                calcularRecursos();
              },
              child: const Text('Calcular Recursos'),
            ),

            const SizedBox(height: 25),

            if (calculoRealizado) ...[
              const Text(
                'Resumo dos Recursos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Text(
                'Combustível necessário: '
                '${combustivelCalculado.toStringAsFixed(2)} kg',
              ),

              Text(
                'Custo do combustível: US\$ '
                '${custoCombustivelCalculado.toStringAsFixed(2)}',
              ),

              Text(
                'Oxigênio necessário: '
                '${oxigenioCalculado.toStringAsFixed(2)} kg',
              ),

              Text(
                'Custo do oxigênio: US\$ '
                '${custoOxigenioCalculado.toStringAsFixed(2)}',
              ),

              const SizedBox(height: 15),

              Text(
                'Orçamento necessário: US\$ '
                '${orcamentoCalculado.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              // Botão para avançar à Tela 3
              ElevatedButton(
                onPressed: avancarParaRiscos,
                child: const Text('Avançar para Riscos e Motores'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
