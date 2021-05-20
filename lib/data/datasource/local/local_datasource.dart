import '../../model/beer_model.dart';

abstract class LocalDatasource {
  Future<void> onInit();
  Future<List<BeerModel>> getSavedBeers([int? limit]);
  Future<void> saveBeers(List<BeerModel> beers);
  Future<void> onDestroy();
}
