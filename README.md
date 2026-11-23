
# 🚀 Simulador de Missão Intergaláctica

Projeto desenvolvido como parte da Atividade Avaliativa 2 da disciplina de Programação Mobile, do curso Técnico em Desenvolvimento de Sistemas da ETEC Albert Einstein.

## 📌 Sobre o projeto

O Simulador de Missão Intergaláctica é uma aplicação desenvolvida em Flutter e Dart que permite configurar, planejar e analisar uma missão espacial.

A aplicação realiza cálculos de consumo de recursos, custos operacionais, disponibilidade financeira e desgaste dos motores, apresentando um relatório completo ao final da simulação.

## 🎯 Objetivos

- Aplicar conceitos de desenvolvimento mobile.
- Trabalhar com múltiplas telas.
- Realizar passagem de parâmetros entre widgets.
- Implementar validações de entrada de dados.
- Aplicar regras de negócio e cálculos matemáticos.
- Gerenciar estados e fluxos de navegação.
- Utilizar Git e GitHub para versionamento.

## 🛠️ Tecnologias utilizadas

- Flutter
- Dart
- Material Design
- Visual Studio Code
- Git
- GitHub

## 📱 Funcionalidades

### Tela 1 — Configuração da Missão

- Identificação do comandante.
- Quantidade de tripulantes.
- Distância da viagem em anos-luz.
- Validação dos dados informados.

### Tela 2 — Recursos e Suprimentos

- Definição da duração da viagem.
- Definição do preço do combustível.
- Cálculo da quantidade de combustível.
- Cálculo da quantidade de oxigênio.
- Cálculo dos custos operacionais.
- Cálculo do orçamento necessário.

### Tela 3 — Riscos e Motores

- Definição do orçamento disponível.
- Controle da velocidade dos motores por Slider.
- Cálculo do saldo financeiro.
- Cálculo do desgaste dos motores.
- Alerta de risco crítico de falência financeira.
- Alerta de possível pane nos motores.
- Invalidação dos resultados após alteração dos dados.

### Tela 4 — Relatório Final

- Resumo completo da missão.
- Informações da tripulação e do destino.
- Recursos e custos operacionais.
- Situação financeira.
- Velocidade e desgaste dos motores.
- Exibição dos alertas de risco.
- Reinício da missão com limpeza do histórico de navegação.

## 🧮 Regras de negócio

| Cálculo | Fórmula |
|---|---|
| Combustível necessário | Distância × Tripulantes × 1000 |
| Custo do combustível | Combustível × Preço por kg |
| Oxigênio necessário | Tripulantes × Dias × 2,5 |
| Custo do oxigênio | Oxigênio × 50 |
| Orçamento necessário | Custo do combustível + Custo do oxigênio |
| Saldo financeiro | Orçamento disponível − Orçamento necessário |
| Desgaste dos motores | (Velocidade ÷ 10) × Dias |

### Condições de risco

- Saldo financeiro negativo: risco crítico de falência financeira.
- Velocidade superior a 80%: alerta de possível pane nos motores.

## 📂 Estrutura principal do projeto

```text
atividade_avaliativa/
├── lib/
│   ├── main.dart
│   ├── tela1_configuracao.dart
│   ├── tela2_recursos.dart
│   ├── tela3_riscos.dart
│   └── tela4_relatorio.dart
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

## 🔄 Fluxo de navegação

```text
Configuração da Missão
         ↓
Recursos e Suprimentos
         ↓
Riscos e Motores
         ↓
Relatório Final
         ↓
Reiniciar Missão
         ↓
Configuração da Missão
```

## 📚 Conceitos aplicados

- StatefulWidget
- StatelessWidget
- TextEditingController
- TextField
- Slider
- ElevatedButton
- SnackBar
- SingleChildScrollView
- setState()
- Navigator.push()
- Navigator.pushAndRemoveUntil()
- Construtores com parâmetros obrigatórios
- Operadores condicionais
- Validação de dados
- Gerenciamento de estado

## ▶️ Como executar o projeto

### Pré-requisitos

- Flutter SDK instalado.
- Git instalado.
- Ambiente de desenvolvimento configurado.

### Clonar o repositório

```bash
git clone https://github.com/Luanlhp777/mobile16.git
```

### Acessar o projeto

```bash
cd mobile16/atividade_avaliativa
```

### Instalar as dependências

```bash
flutter pub get
```

### Executar a aplicação

```bash
flutter run
```

### Executar no navegador Chrome

```bash
flutter run -d chrome
```

### Realizar análise estática

```bash
flutter analyze
```

## 🧪 Validações realizadas

- Validação dos campos obrigatórios.
- Validação de valores numéricos.
- Conferência dos cálculos de recursos.
- Conferência do saldo financeiro.
- Simulação de orçamento insuficiente.
- Simulação de velocidade superior a 80%.
- Passagem de parâmetros entre telas.
- Invalidação de resultados desatualizados.
- Reinício da missão.
- Análise estática do código.

## 📊 Status do projeto

🟢 Desenvolvimento concluído.

## 🎓 Informações acadêmicas

- Instituição: ETEC Albert Einstein
- Curso: Técnico em Desenvolvimento de Sistemas
- Disciplina: Programação Mobile
- Professor: Alex Sander
- Atividade: Atividade Avaliativa 2
- Ano: 2026

## 👨‍💻 Autor

**Luan Araújo**

[GitHub](https://github.com/Luanlhp777) |
[LinkedIn](https://www.linkedin.com/in/luan-pereira-24a8ba86/)

---

Projeto desenvolvido para fins acadêmicos e aprimoramento dos conhecimentos em desenvolvimento mobile com Flutter e Dart.
