import '../../model/beer_model.dart';

abstract class LocalDatasource {
  Future<void> onInit();
  Future<List<BeerModel>> getSavedBeers();
  Future<void> saveBeer(BeerModel beer);
  Future<void> removeBeer(int id);
  Future<void> update(BeerModel beer);
  Future<void> onDestroy();
}
