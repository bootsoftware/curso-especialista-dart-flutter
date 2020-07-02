import 'package:sqflite/sqflite.dart';

import 'migrations/migration_v2.dart';
import 'migrations/migration_v3.dart';

void upgradeAdm({Batch batch, Database db, int oldVersion, int newVersion}) {
  if (oldVersion < 2) {
    upgradeV2(batch);
    print('---- ATUALIZANDO BANCO DE DADOS PARA V2 ...');
  }
  if (oldVersion < 3) {
    upgradeV3(batch);
    print('---- ATUALIZANDO BANCO DE DADOS PARA V3 ...');
  }
  if (oldVersion < 4) {
    //upgradeV3(batch);
    print('---- ATUALIZANDO BANCO DE DADOS PARA V4 ...');
  }
  batch.commit();
}
