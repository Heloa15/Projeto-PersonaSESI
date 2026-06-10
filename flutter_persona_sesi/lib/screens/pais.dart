import 'package:flutter/material.dart';
import 'home.dart';

class Pais extends StatefulWidget {
  const Pais({super.key});

  @override
  State<Pais> createState() => _PaisState();
}

class _PaisState extends State<Pais> {
  // Controle do filho selecionado para alternar os dados na tela
  String filhoSelecionado = "Ana Silva";

  // Widget para os cartões de resumo superiores (Responsivos e sem overflow)
  Widget resumoCard(String titulo, String valor, String subtexto, IconData icone) {
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
              Expanded(
                child: Text(
                  titulo, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icone, color: Colors.grey.shade400, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            valor, 
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)
          ),
          const SizedBox(height: 4),
          Text(
            subtexto, 
            style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Widget para a linha de desempenho das notas com barra de progresso horizontal
  Widget materiaProgressoItem(String materia, double notaAtual, double meta, Color corBarra) {
    // Calcula o percentual para a barra (ex: nota 8.5 vira 0.85 para o preenchimento)
    double valorProgresso = (notaAtual / 10).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                materia, 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: corBarra,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  notaAtual.toStringAsFixed(1),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: valorProgresso,
            backgroundColor: Colors.grey.shade100,
            color: corBarra,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Meta: ${meta.toString()}", style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              Text("Atual: ${notaAtual.toString()}", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final larguraDisponivel = MediaQuery.of(context).size.width;
    
    // Grid dinâmico para os cartões superiores
    final larguraDoCard = larguraDisponivel > 600 ? 160.0 : (larguraDisponivel - 44) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false,
              ),
            ),
            const Text("Voltar ao Início", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "moniquebablerr@gmail.com (Responsável)", 
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black87),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false,
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Área dos Pais", 
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)
            ),
            Text(
              "Acompanhe o desenvolvimento dos seus filhos", 
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500)
            ),
            const SizedBox(height: 20),

            // Seletores de Filhos (Ana Silva / Pedro Silva) como no protótipo
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => filhoSelecionado = "Ana Silva"),
                  icon: const Icon(Icons.person, size: 16),
                  label: const Text("Ana Silva"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: filhoSelecionado == "Ana Silva" ? const Color(0xFFD32F2F) : Colors.white,
                    foregroundColor: filhoSelecionado == "Ana Silva" ? Colors.white : Colors.black87,
                    elevation: 0,
                    side: BorderSide(color: filhoSelecionado == "Ana Silva" ? const Color(0xFFD32F2F) : Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: () => setState(() => filhoSelecionado = "Pedro Silva"),
                  icon: const Icon(Icons.person_outline, size: 16),
                  label: const Text("Pedro Silva"),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: filhoSelecionado == "Pedro Silva" ? const Color(0xFFD32F2F) : Colors.white,
                    foregroundColor: filhoSelecionado == "Pedro Silva" ? Colors.white : Colors.black87,
                    side: BorderSide(color: filhoSelecionado == "Pedro Silva" ? const Color(0xFFD32F2F) : Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Cartões de Resumo Adaptáveis com Wrap
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Média Geral", filhoSelecionado == "Ana Silva" ? "8.8" : "7.9", "Última atualização hoje", Icons.trending_up),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Frequência", filhoSelecionado == "Ana Silva" ? "95%" : "92%", "Média de presenças", Icons.calendar_today_outlined),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Atividades", "3", "Este mês", Icons.bookmark_border),
                ),
                SizedBox(
                  width: larguraDoCard,
                  child: resumoCard("Turma", filhoSelecionado == "Ana Silva" ? "6º Ano A" : "8º Ano B", filhoSelecionado == "Ana Silva" ? "12 anos" : "14 anos", Icons.school_outlined),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Abas de Navegação Interna Simbolizadas (Notas, Progresso, Atividades, Comunicação)
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
              ),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text("Notas", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text("Progresso", style: TextStyle(color: Colors.black54)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text("Atividades", style: TextStyle(color: Colors.black54)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text("Comunicação", style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Listagem de Notas com as Barras Horizontais Dinâmicas
            filhoSelecionado == "Ana Silva"
                ? Column(
                    children: [
                      materiaProgressoItem("Matemática", 8.5, 8.0, const Color(0xFFD32F2F)),
                      materiaProgressoItem("Português", 9.2, 8.5, const Color(0xFFD32F2F)),
                    ],
                  )
                : Column(
                    children: [
                      materiaProgressoItem("Matemática", 7.2, 8.0, Colors.orange),
                      materiaProgressoItem("Português", 8.5, 8.5, const Color(0xFFD32F2F)),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}