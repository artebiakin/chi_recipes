import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'data/datasource/local/local_datasource.dart';
import 'data/datasource/local/local_datasource_imp.dart';
import 'data/datasource/remote/remote_datasource.dart';
import 'data/datasource/remote/remote_datasource_mock.dart';
import 'data/repositories/beer_repository_impl.dart';
import 'domain/repositories/beer_repository.dart';

late Database beerDB;

Future<void> init() async {
  Get
    // Repository
    ..lazyPut<BeerRepository>(
      () => BeerRepositoryImpl(
        localDatasource: Get.find(),
        remoteDatasource: Get.find(),
      ),
    )

    // Datasource
    ..lazyPut<RemoteDatasource>(() => RemoteDatasourceMock())
    ..lazyPut<LocalDatasource>(() => LocalDataSourceImpl())

    // External
    ..lazyPut<Dio>(
        () => Dio()..options.baseUrl = 'https://api.punkapi.com/v2/');

  await Get.find<LocalDatasource>().onInit();
}

Future<void> destroy() async {
  await Get.find<LocalDatasource>().onDestroy();
}
