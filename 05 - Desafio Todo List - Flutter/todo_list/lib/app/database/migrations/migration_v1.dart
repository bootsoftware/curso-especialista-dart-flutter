import 'package:sqflite/sqflite.dart';

void createV1(Batch batch) {
  batch.execute('''  
    CREATE TABLE TODO(
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      DESCRICAO  VARCHAR(500) NOT NULL,
      DATA_HORA DATETIME,
      FINALIZADO INTEGER
    )  
  ''');
}
