import 'package:flutter/material.dart';
import 'aluno.dart';
import 'professor.dart';
import 'pais.dart';
import 'coordenador.dart'; // IMPORTANTE: Importação da nova tela adicionada!

class Login extends StatefulWidget {
  final String tipoUsuario;
  const Login({super.key, required this.tipoUsuario});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  String get obterTitulo {
    switch (widget.tipoUsuario) {
      case 'professor': return "Login do Professor";
      case 'coordenador': return "Login do Coordenador";
      case 'pais': return "Login dos Pais";
      default: return "Login do Aluno";
    }
  }

  void entrar() {
    if (email.text.isEmpty || senha.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha e-mail e senha")),
      );
      return;
    }

    Widget telaDestino;
    switch (widget.tipoUsuario) {
      case 'professor':
        telaDestino = const Professor();
        break;
      case 'pais':
        telaDestino = const Pais();
        break;
      case 'coordenador':
        telaDestino = const Coordenador(); // Redireciona corretamente para a tela do Coordenador
        break;
      default:
        telaDestino = const Aluno();
        break;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => telaDestino),
    );
  }

  @override
  void dispose() {
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 450,
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Color(0xFFFFEBEE),
                    child: Icon(Icons.person_outline, size: 30, color: Color(0xFFE53935)),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  obterTitulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 32),
                const Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 8),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "seu@email.com",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.mail_outline, color: Colors.grey.shade400, size: 20),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFFE53935))),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Senha", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 8),
                TextField(
                  controller: senha,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Sua senha",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade400, size: 20),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFFE53935))),
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE53935), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                    onPressed: entrar,
                    child: const Text("Entrar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade300), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Voltar", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}