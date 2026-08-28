import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget card(
    BuildContext context,
    String titulo,
    String descricao,
    IconData icone,
    String tipo,
  ) {
    return SizedBox(
      width: 240,

      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0x1FE53935),

              child: Icon(icone, color: const Color(0xFFE53935), size: 28),
            ),

            const SizedBox(height: 15),

            Text(
              titulo,
              textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              descricao,

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),

                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),

                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => Login(tipoUsuario: tipo),
                    ),
                  );
                },

                child: const Text(
                  "Fazer Login",

                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 1,

        title: const Text(
          "🎓 Pers💡na SESI",

          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100),

            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                const SizedBox(height: 40),

                const Text(
                  "Transformando a Educação com Tecnologia",

                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                Text(
                  "Uma plataforma integrada que conecta estudantes, professores, coordenadores e pais.",

                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),

                const SizedBox(height: 50),

                Wrap(
                  alignment: WrapAlignment.center,

                  spacing: 20,

                  runSpacing: 20,

                  children: [
                    card(
                      context,
                      "Área do Aluno",
                      "Acesse notas, materiais e acompanhe seu desempenho.",
                      Icons.school,
                      "aluno",
                    ),

                    card(
                      context,
                      "Área do Professor",
                      "Gerencie turmas e acompanhe alunos.",
                      Icons.person,
                      "professor",
                    ),

                    card(
                      context,
                      "Área do Coordenador",
                      "Controle geral da escola.",
                      Icons.settings,
                      "coordenador",
                    ),

                    card(
                      context,
                      "Área dos Pais",
                      "Acompanhe notas e frequência.",
                      Icons.family_restroom,
                      "pais",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
