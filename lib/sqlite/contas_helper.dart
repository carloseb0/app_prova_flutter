import 'dart:async';

import 'package:app_prova/model/conta.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContasHelper {
  static final ContasHelper _instance = ContasHelper.internal();
  factory ContasHelper() => _instance;
  ContasHelper.internal();
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), "contas_base.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVers) async {
      await db.execute("CREATE TABLE contaspagar(id TEXT PRIMARY KEY, " +
          "nome TEXT, dapagamento TEXT, vlpagamento TEXT, flfinalizado TEXT))");
    });
  }

  Future<List<Conta>> obterTodos() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM contaspagar");
    List<Conta> listContact = List.empty(growable: true);
    for (Map<String, dynamic> m in listMap) {
      Conta c = Conta.fromMap(m);
      listContact.add(c);
    }
    return listContact;
  }

  Future<Conta> inserir(Conta contact) async {
    Database dbContact = await db;
    int? idNew = Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT MAX(id) FROM contaspagar"));
    if (idNew == null) {
      idNew = 1;
    } else {
      idNew = idNew + 1;
    }
    contact.id = idNew.toString();
    await dbContact.insert('contaspagar', contact.toMap());
    return contact;
  }

  Future<int> alterar(Conta obj) async {
    Database dbContact = await db;
    return await dbContact.update('contaspagar', obj.toMap(),
        where: "id = ?", whereArgs: [obj.id]);
  }

  Future<int> excluir(String idDel) async {
    Database dbContact = await db;
    return await dbContact
        .delete('contaspagar', where: "id = ?", whereArgs: [idDel]);
  }

  Future<Conta?> getObjeto(String idFind) async {
    Database dbContact = await db;
    List<Map<String, dynamic>> maps = await dbContact.query('contaspagar',
        columns: ['id', 'nome'], where: "id = ?", whereArgs: [idFind]);
    if (maps.isNotEmpty) {
      return Conta.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int?> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM contaspagar"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
