import 'package:flutter/material.dart';
import 'tela4_relatorio.dart';

class Tela3Riscos extends StatefulWidget {
  // Dados recebidos da Tela 1
  final String nome;
  final int tripulantes;
  final double distancia;

  // Dados recebidos e calculados na Tela 2
  final int dias;
  final double precoCombustivel;
  final double combustivel;
  final double custoCombustivel;
  final double oxigenio;
  final double custoOxigenio;
  final double orcamentoNecessario;

  const Tela3Riscos({
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
  });

  @override
  State<Tela3Riscos> createState() => _Tela3RiscosState();
}

class _Tela3RiscosState extends State<Tela3Riscos> {

  // Controlador do orçamento disponível
  final orcamentoController = TextEditingController();

  // Velocidade dos motores em porcentagem
  double velocidadeMotor = 50;

  // Resultados da análise
  double orcamentoDisponivel = 0;
  double saldoFinal = 0;
  double desgasteMotor = 0;

  bool analiseRealizada = false;

  @override
  void dispose() {
    orcamentoController.dispose();
    super.dispose();
  }

  // Calcula os riscos financeiros e o desgaste dos motores
  void calcularRiscos() {
    double? orcamento = double.tryParse(
      orcamentoController.text.trim().replaceAll(',', '.'),
    );

    // Validação do orçamento
    if (orcamento == null || !orcamento.isFinite || orcamento < 0) {
      mostrarErro('Informe um orçamento válido.');
      return;
    }

    // Calcula o saldo financeiro
    double saldo = orcamento - widget.orcamentoNecessario;

    // Calcula o desgaste dos motores
    double desgaste = (velocidadeMotor / 10) * widget.dias;

    // Atualiza os resultados na interface
    setState(() {
      orcamentoDisponivel = orcamento;
      saldoFinal = saldo;
      desgasteMotor = desgaste;
      analiseRealizada = true;
    });
  }

  // Exibe mensagens de erro
  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem), backgroundColor: Colors.red),
    );
  }

  // Avança para o relatório final da missão
  void avancarParaRelatorio() {
    // Impede avançar sem realizar a análise
    if (!analiseRealizada) {
      mostrarErro('Realize a análise de riscos antes de avançar.');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela4Relatorio(
          // Dados da Tela 1
          nome: widget.nome,
          tripulantes: widget.tripulantes,
          distancia: widget.distancia,

          // Dados da Tela 2
          dias: widget.dias,
          precoCombustivel: widget.precoCombustivel,
          combustivel: widget.combustivel,
          custoCombustivel: widget.custoCombustivel,
          oxigenio: widget.oxigenio,
          custoOxigenio: widget.custoOxigenio,
          orcamentoNecessario: widget.orcamentoNecessario,

          // Dados da Tela 3
          orcamentoDisponivel: orcamentoDisponivel,
          saldoFinal: saldoFinal,
          velocidadeMotor: velocidadeMotor,
          desgasteMotor: desgasteMotor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riscos e Motores'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Análise de Riscos e Motores',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Informações da missão
            Text('Comandante: ${widget.nome}'),
            Text('Tripulantes: ${widget.tripulantes}'),
            Text('Dias de viagem: ${widget.dias}'),
            Text(
              'Orçamento necessário: US\$ '
              '${widget.orcamentoNecessario.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 25),

            // Orçamento disponível
            TextField(
              controller: orcamentoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onChanged: (valor) {
                setState(() {
                  analiseRealizada = false;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Orçamento disponível (US\$)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // Velocidade dos motores
            Text(
              'Velocidade dos motores: ${velocidadeMotor.toInt()}%',
              style: const TextStyle(fontSize: 18),
            ),

            Slider(
              value: velocidadeMotor,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${velocidadeMotor.toInt()}%',
              onChanged: (novoValor) {
                setState(() {
                  velocidadeMotor = novoValor;
                  analiseRealizada = false;
                });
              },
            ),

            const SizedBox(height: 25),

            // Botão para analisar os riscos da missão
            ElevatedButton(
              onPressed: () {
                calcularRiscos();
              },
              child: const Text('Analisar Riscos'),
            ),

            const SizedBox(height: 25),

            if (analiseRealizada) ...[
              const Text(
                'Resultado da Análise',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // Saldo financeiro
              Text(
                'Saldo financeiro: US\$ ${saldoFinal.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: saldoFinal < 0 ? Colors.red : Colors.green,
                ),
              ),

              // Alerta de orçamento insuficiente
              if (saldoFinal < 0)
                const Text(
                  'RISCO CRÍTICO: Falência financeira da missão!',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(height: 15),

              // Desgaste dos motores
              Text('Desgaste dos motores: ${desgasteMotor.toStringAsFixed(2)}'),

              // Alerta de velocidade elevada
              if (velocidadeMotor > 80)
                const Text(
                  'ALERTA: Possível pane nos motores!',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],

            const SizedBox(height: 20),

            // Botão para abrir o relatório final
            ElevatedButton(
              onPressed: avancarParaRelatorio,
              child: const Text('Avançar para Relatório Final'),
            ),
          ],
        ),
      ),
    );
  }
}
