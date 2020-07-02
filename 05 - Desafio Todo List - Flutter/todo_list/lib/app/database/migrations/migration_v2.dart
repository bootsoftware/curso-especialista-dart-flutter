import 'package:sqflite/sqflite.dart';

void createV2(Batch batch) {
  batch.execute('''  
    CREATE TABLE CREATE_V2(
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      DESCRICAO  VARCHAR(500) NOT NULL,
      DATA_HORA DATETIME,
      FINALIZADO INTEGER
    )  
  ''');
}

void upgradeV2(Batch batch) {
  batch.execute('''  
    CREATE TABLE UPGRADE_V2(
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      DESCRICAO  VARCHAR(500) NOT NULL,
      DATA_HORA DATETIME,
      FINALIZADO INTEGER
    )  
  ''');
}
