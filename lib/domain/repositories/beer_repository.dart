import 'package:get/get.dart';

import '../entities/beer.dart';

abstract class BeerRepository extends GetxService {
  Future<List<Beer>> getBeers();
  Future<List<Beer>> getSavedBeers();
  Future<void> saveBeer(Beer beer);
  Future<void> removeFromSavedBeer(int id);
}
