import 'package:sqflite/sqflite.dart';

// void createV3(Batch batch) {
//   batch.execute('''
//     CREATE TABLE UPGRADE_V3(
//       ID INTERGER PRIMARY KEY AUTOINCREMENT,
//       DESCRICAO  VARCHAR(500) NOT NULL,
//       DATA_HORA DATETIME,
//       FINALIZADO INTEGER
//     )
//   ''');
// }

void upgradeV3(Batch batch) {
  batch.execute('''  
    CREATE TABLE UPGRADE_V3(
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      DESCRICAO  VARCHAR(500) NOT NULL,
      DATA_HORA DATETIME,
      FINALIZADO INTEGER
    )  
  ''');
}
