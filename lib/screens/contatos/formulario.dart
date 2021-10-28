import 'package:flutter/material.dart';
import 'package:contatos_persistencia/models/contato.dart';

class FormularioContato extends StatefulWidget {
  @override
  State<FormularioContato> createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(
                labelText: 'Número',
              ),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String nome = (_nomeController.text) != null
                        ? _nomeController.text
                        : ' ';
                    final int numero =
                        int.tryParse(_numeroController.text) != null
                            ? int.parse(_numeroController.text)
                            : -1;
                    if (nome != ' ' && numero != -1) {
                      final Contato novoContato = Contato(nome, numero);
                      Navigator.pop(context, novoContato);
                    }
                  },
                  child: Text('Criar Contato'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
