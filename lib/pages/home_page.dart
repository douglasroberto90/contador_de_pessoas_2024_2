import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  final lotacaoMaxima = 15;

  void incrementar() {
    if (contador < 15) {
      setState(() {
        contador++;
      });
    }
  }

  void decrementar() {
    if (contador > 0) {
      setState(() {
        contador--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fundo.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              contador != lotacaoMaxima ? "Pode entrar!" : "Lotado!",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "$contador",
              style: TextStyle(
                  fontSize: 70,
                  color: contador != lotacaoMaxima ? Colors.black : Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementar,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 120),
                    backgroundColor: contador < lotacaoMaxima
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: decrementar,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 120),
                    backgroundColor: contador > 0
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text(
                    "Saiu",
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
