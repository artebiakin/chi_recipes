import '../../model/beer_model.dart';

abstract class RemoteDatasource {
  Future<List<BeerModel>> getBeer({int limit = 20, int offset = 0});
}
