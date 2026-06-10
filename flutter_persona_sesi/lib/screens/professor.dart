import 'package:flutter/material.dart';

class Professor extends StatelessWidget {
  const Professor({super.key});

  // Card informativo superior simplificado e à prova de quebras
  Widget resumoCard(String titulo, String valor, String subtexto, IconData icone, Color corValor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titulo, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)
              ),
              Icon(icone, color: Colors.grey.shade400, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            valor, 
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: corValor)
          ),
          const SizedBox(height: 4),
          Text(
            subtexto, 
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)
          ),
        ],
      ),
    );
  }

  // Linha das turmas recentes (Lado esquerdo)
  Widget turmaItem(String ano, String alunos, String media, Color corMedia) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ano, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(alunos, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(media, style: TextStyle(color: corMedia, fontWeight: FontWeight.bold, fontSize: 14)),
              Text("Média", style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }

  // Linha das atividades para correção (Lado direito)
  Widget correcaoItem(String tarefa, String subtitulo, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tarefa, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(subtitulo, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            ],
          ),
          Text(
            status, 
            style: TextStyle(color: Colors.orange.shade800, fontWeight: FontWeight.bold, fontSize: 12)
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Captura o tamanho disponível na tela do aparelho de forma responsiva
    final larguraDisponivel = MediaQuery.of(context).size.width;
    // Define a largura do card: se for web/tablet vira estático, se for celular divide o espaço igualmente
    final larguraDoCard = larguraDisponivel > 600 ? 160.0 : (larguraDisponivel - 52) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      
      appBar: AppBar(
        title: const Text("Dashboard do Professor", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bem-vindo, Prof. Silva!", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),

            // Distribuição inteligente com Wrap (Adeus problemas de pixel overflow!)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Total de Alunos", "127", "+5 este mês", Icons.people_outline, Colors.black87),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Turmas", "5", "Ativas", Icons.menu_book, Colors.black87),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Tarefas Criadas", "0", "Total", Icons.assignment_outlined, Colors.black87),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Média Geral", "8.2", "+0.3 este mês", Icons.trending_up, Colors.green),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Seção Inferior 1: Turmas Recentes
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Turmas Recentes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  turmaItem("9º Ano A - Matemática", "32 alunos", "8.5", Colors.green),
                  turmaItem("8º Ano B - Matemática", "28 alunos", "7.8", Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Seção Inferior 2: Atividades para Correção
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Atividades para Correção", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  correcaoItem("Prova de Álgebra", "9º Ano A - 15 provas", "Pendente"),
                  correcaoItem("Lista de Exercícios", "8º Ano B - 12 listas", "Pendente"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}