import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as db;
import 'package:sqflite/sqflite.dart';

import 'data/datasource/local/local_datasource.dart';
import 'data/datasource/local/local_datasource_imp.dart';
import 'data/datasource/remote/remote_datasource.dart';
import 'data/datasource/remote/remote_datasource_imp.dart';

late Database beerDB;

Future<void> init() async {
  beerDB = await db.openDatabase(
    'beer_database.db',
    onCreate: (db, _) => db.execute(
      'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    ),
  );

  Get
    // Datasource
    ..lazyPut<RemoteDatasource>(() => RemoteDatasourceImp(Get.find()))
    ..lazyPut<LocalDatasource>(() => LocalDataSourceImpl())

    // External
    ..lazyPut<Dio>(
        () => Dio()..options.baseUrl = 'https://api.punkapi.com/v2/');

  await Get.find<LocalDatasource>().onInit();
}

Future<void> destroy() async {
  await Get.find<LocalDatasource>().onDestroy();
}
