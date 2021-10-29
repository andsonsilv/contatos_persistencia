import 'package:contatos_persistencia/database/dao/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'database_contatos.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.tableSql);
    },
    version: 1,
  );
}