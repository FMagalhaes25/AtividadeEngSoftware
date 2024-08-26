import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina3 extends StatefulWidget {
  final String resultado;
  const Pagina3({super.key, required this.resultado});

  @override
  State<Pagina3> createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Text(widget.resultado),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(0, 26, 114, 1)),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
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
        ],),
      )
    );
  }
}