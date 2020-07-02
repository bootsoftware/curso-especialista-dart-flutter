import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list/app/database/migrations/migration_v1.dart';

import 'upgrade_adm.dart';

class Connection {
  static const VERSION = 1;
  static const DATABASE_NAME = 'TODO_LIST';
  static Connection _instance;
  final _lock = Lock();
  Database _db;

  factory Connection() {
    if (_instance == null) {
      _instance = Connection._();
    }
    return _instance;
  }
  Connection._();
  Future<Database> get instance async => await _openConnection();

  Future<Database> _openConnection() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          var databasePaht = await getDatabasesPath();
          var pathDatabase = join(databasePaht, DATABASE_NAME);
          _db = await openDatabase(
            pathDatabase,
            version: VERSION,
            onConfigure: _onConfigure,
            onCreate: _onCreate,
            onUpgrade: _onUpgrade,
          );
        }
      });
    }
    return _db;
  }

  closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<FutureOr<void>> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = on');
  }

  FutureOr<void> _onCreate(Database db, int version) {
    var batch = db.batch();
    createV1(batch);
    // createV2(batch);
    batch.commit();
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    var batch = db.batch();
    upgradeAdm(
      batch: batch,
      db: db,
      oldVersion: oldVersion,
      newVersion: newVersion,
    );
    //   if (oldVersion < 2) {
    //     upgradeV2(batch);
    //     print('---- ATUALIZANDO BANCO DE DADOS PARA V2 ...');
    //   }
    //   if (oldVersion < 3) {
    //     upgradeV3(batch);
    //     print('---- ATUALIZANDO BANCO DE DADOS PARA V3 ...');
    //   }
    //   if (oldVersion < 4) {
    //     //upgradeV3(batch);
    //     print('---- ATUALIZANDO BANCO DE DADOS PARA V4 ...');
    //   }
    //   batch.commit();
    // }
  }
}
