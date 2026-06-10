import 'package:flutter/material.dart';

class Aluno extends StatelessWidget {
  const Aluno({super.key});

  // Widget para os cartões de resumo (Sem altura fixa para evitar overflow)
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
        mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titulo, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)
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

  // Gráfico de barras simples
  Widget barraGrafico(String materia, double alturaGrade, double alturaAverage) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 25, height: alturaGrade * 12, color: const Color(0xFFD32F2F)),
              const SizedBox(width: 4),
              Container(width: 25, height: alturaAverage * 12, color: const Color(0xFF90A4AE)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(materia, style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  // Item de atividade recente
  Widget atividadeItem(String tag, String titulo, String subverso, String nota, Color corTag) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: corTag.withValues(alpha: 0.1), 
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text(tag, style: TextStyle(color: corTag, fontWeight: FontWeight.bold, fontSize: 11)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subverso, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(nota, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pegamos a largura total disponível na tela para calcular o tamanho dos cartões dinamicamente
    final larguraDisponivel = MediaQuery.of(context).size.width;
    // Se a tela for pequena (celular), cada cartão ocupa quase metade da largura. Se for grande, ocupa menos.
    final larguraDoCard = larguraDisponivel > 600 ? 160.0 : (larguraDisponivel - 52) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      
      appBar: AppBar(
        title: const Text("Dashboard do Aluno", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bem-vindo, João Silva!", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),

            // OBRIGATÓRIO: Trocamos GridView por Wrap para evitar de vez o erro de Overflow!
            Wrap(
              spacing: 12, // Espaço na horizontal entre os cartões
              runSpacing: 12, // Espaço na vertical caso eles quebrem de linha
              children: [
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Média Geral", "8.7", "+0.5 este mês", Icons.trending_up, Colors.green),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Matérias", "2", "Principais", Icons.menu_book, Colors.black87),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Tarefas", "2", "Pendentes", Icons.assignment_late, Colors.orange),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Pontuação", "1,247", "Pontos totais", Icons.emoji_events, Colors.amber.shade700),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Seção: Desempenho por Matéria
            Container(
              padding: const EdgeInsets.all(16),
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Desempenho por Matéria", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        barraGrafico("Matemática", 9.0, 7.8),
                        barraGrafico("Português", 8.5, 7.5),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Seção: Atividades Recentes
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
                  const Text("Atividades Recentes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  atividadeItem("Matemática", "Prova de Álgebra", "Entregue em 28/05", "9.2", Colors.green),
                  atividadeItem("Português", "Redação", "Entregue em 25/05", "8.5", Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}