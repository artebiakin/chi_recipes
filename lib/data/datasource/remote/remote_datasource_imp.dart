import 'package:dio/dio.dart';

import '../../../core/errors/exceptions.dart';
import '../../model/beer_model.dart';
import 'remote_datasource.dart';

class RemoteDatasourceImp extends RemoteDatasource {
  RemoteDatasourceImp(this._dio);

  final Dio _dio;

  @override
  Future<List<BeerModel>> getBeer({int limit = 20, int offset = 1}) async {
    try {
      final uri = Uri.parse('beers?page=$offset&per_page=$limit');
      final response = await _dio.getUri(uri);
      final listJson = response.data as List;

      final beers = listJson.map((e) => BeerModel.fromMap(e)).toList();

      return beers;
    } catch (e) {
      throw ServerException(code: 500, message: e.toString());
    }
  }
}
