import 'package:contatos_persistencia/database/dao/contato_dao.dart';
import 'package:contatos_persistencia/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController =
  TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numeroController,
                decoration: const InputDecoration(
                  labelText: 'Numero',
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Criar Contato'),
                  onPressed: () {
                    _criaContato(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _criaContato(BuildContext context) {
    final String nome = _nomeController.text;
    final int numero =  int.tryParse(_numeroController.text) != null
        ? int.parse(_numeroController.text)
        : -1;

    if (nome != '' && numero != -1) {
      final Contato novoContato = Contato(0, nome, numero);
      _dao.salvar(novoContato).then((id) => Navigator.pop(context));
    }
  }
}
