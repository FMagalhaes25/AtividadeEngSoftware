import 'package:flutter/material.dart';
import 'package:flutter_application_1/2pagina.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  bool erro = false;
  List<TextEditingController> textControllers = List.generate(8, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Text("Insira 8 números inteiros"),
              ),
              for (int i = 0; i < 8; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 30, 100, 30),
                  child: TextField(
                    controller: textControllers[i],
                    decoration: InputDecoration(
                      hintText: erro ? "Algum valor está incorreto." : '',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: erro ? Colors.red : Colors.black)
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromRGBO(0, 26, 114, 1)),
                  ),
                  onPressed: () {
                    List<int> lista = [];
                    setState(() {
                      erro = false;
                    });
                    try {
                      for (var controller in textControllers) {
                        lista.add(int.parse(controller.text));
                      }
                      lista.sort();
                      Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  Pagina2(lista: lista)));
                    } catch (e) {
                      setState(() {
                        erro = true;
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                    child: Text(
                      "Entra",
                      style: TextStyle(
                          color: Color.fromRGBO(216, 207, 207, 1),
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
