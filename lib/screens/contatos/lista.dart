import 'package:contatos_persistencia/database/dao/contato_dao.dart';
import 'package:contatos_persistencia/models/contato.dart';
import 'package:contatos_persistencia/screens/contatos/formulario.dart';
import 'package:flutter/material.dart';

class ListaContato extends StatefulWidget {
  @override
  _ListaContatoState createState() => _ListaContatoState();
}

class _ListaContatoState extends State<ListaContato> {
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: const [],
        future: _dao.buscarTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato>? contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos![index];
                  return _ItemContato(contato);
                },
                itemCount: contatos!.length,
              );
          }
          return const Text('Erro desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => FormularioContato(),
            ),
          )
              .then(
                (value) => setState(() {}),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;

  const _ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numero.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}