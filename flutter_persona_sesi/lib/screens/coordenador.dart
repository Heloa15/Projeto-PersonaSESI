import 'package:flutter/material.dart';
import 'home.dart';

class Coordenador extends StatelessWidget {
  const Coordenador({super.key});

  // Widget para os cartões de resumo com travas de segurança contra estouro (Overflow)
  Widget resumoCard(String titulo, String valor, String subtexto, IconData icone, Color corValor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
              Expanded(
                child: Text(
                  titulo, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 4),
              Icon(icone, color: Colors.grey.shade400, size: 16),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            valor, 
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: corValor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Text(
            subtexto, 
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  // Gráfico de barras simples para o desempenho geral das turmas
  Widget barraGrafico(String materia, double alturaTurma, double alturaMeta) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 22, height: alturaTurma * 12, color: const Color(0xFFD32F2F)),
              const SizedBox(width: 4),
              Container(width: 22, height: alturaMeta * 12, color: const Color(0xFF90A4AE)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(materia, style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  // Widget para a linha de Frequência Escolar Mensal
  Widget frequenciaItem(String mes, String porcentagem, double progresso) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(mes, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              Text(porcentagem, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFD32F2F))),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progresso,
            backgroundColor: Colors.grey.shade200,
            color: const Color(0xFFD32F2F),
            minHeight: 6,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final larguraDisponivel = MediaQuery.of(context).size.width;
    
    // Ajuste dinâmico refinado para telas estreitas de celular
    final larguraDoCard = larguraDisponivel > 600 ? 160.0 : (larguraDisponivel - 44) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      
      appBar: AppBar(
        title: const Text("Dashboard do Coordenador", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Color(0xFFE53935)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false,
              );
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gestão Escolar - Ensino Fundamental II", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 16),

            // Cartões Superiores de Métricas Globais com Wrap adaptativo
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Total Alunos", "216", "6º ao 9º ano", Icons.people_outline, Colors.black87),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Média Geral", "8.1", "+0.2 este ano", Icons.trending_up, Colors.green),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Frequência", "92.5%", "Média da escola", Icons.calendar_today_outlined, Colors.blue),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Taxa Aprovação", "98.5%", "Meta (95%)", Icons.emoji_events_outlined, Colors.amber.shade700),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Layout de seções responsivo
            if (larguraDisponivel > 750)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildDesempenhoBox()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildFrequenciaBox()),
                ],
              )
            else
              Column(
                children: [
                  _buildDesempenhoBox(),
                  const SizedBox(height: 16),
                  _buildFrequenciaBox(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // Seção Interna: Desempenho por Matéria
  Widget _buildDesempenhoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Desempenho por Matéria", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text("Média das Notas vs Recomendada", style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                barraGrafico("Matemática", 8.1, 7.0),
                barraGrafico("Português", 8.3, 7.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Seção Interna: Frequência Escolar Recente
  Widget _buildFrequenciaBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Frequência Escolar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text("Acompanhamento de presença mensal", style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),
          frequenciaItem("Abril", "94.2%", 0.942),
          frequenciaItem("Maio", "93.8%", 0.938),
          frequenciaItem("Junho (Parcial)", "92.5%", 0.925),
        ],
      ),
    );
  }
}