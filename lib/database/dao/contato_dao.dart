import 'package:contatos_persistencia/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contatos_persistencia/database/app_database.dart';

class ContatoDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numero INTEGER)';
  static const String _tableName = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numero = 'numero';

  Future<int> salvar(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contatoMap = _mapear(contato);
    return db.insert(_tableName, contatoMap);
  }

  Future<List<Contato>> buscarTodos() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    List<Contato> contato = _listar(resultado);
    return contato;
  }

  Map<String, dynamic> _mapear(Contato contato) {
    final Map<String, dynamic> contatoMap = {};
    contatoMap[_nome] = contato.nome;
    contatoMap[_numero] = contato.numero;
    return contatoMap;
  }

  List<Contato> _listar(List<Map<String, dynamic>> resultado) {
    final List<Contato> contatoLista = [];
    for (Map<String, dynamic> row in resultado) {
      final Contato contato = Contato(
        row[_id],
        row[_nome],
        row[_numero],
      );
      contatoLista.add(contato);
    }
    return contatoLista;
  }
}