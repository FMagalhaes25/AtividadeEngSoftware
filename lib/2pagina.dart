import 'package:flutter/material.dart';
import 'package:flutter_application_1/3pagina.dart';

class Pagina2 extends StatefulWidget {
  final List<int> lista;
  const Pagina2({super.key, required this.lista});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController _controller = TextEditingController();
  bool erro = false;
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Digite o número de busca:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número',
                errorText: erro ? 'Número inválido ou não encontrado' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    erro = false;
                  });
              
                  final String chave = _controller.text;
                  try {
                    int chaveInt = int.parse(chave);
                    if (widget.lista.contains(chaveInt)) {
                      int posicao = widget.lista.indexOf(chaveInt);
                      resultado = 'Número encontrado na posição $posicao';
                    } else {
                      resultado = 'Número não encontrado';
                    }
                    Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>  Pagina3(resultado: resultado)));
                  } catch (e) {
                    setState(() {
                      erro = true;
                    });
                  }
              
                  if (!erro) {
                    setState(() {});
                  }
                },
                child: const Text('Entra'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
