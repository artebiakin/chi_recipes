import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../core/errors/failure.dart';
import '../entities/beer.dart';

abstract class BeerRepository extends GetxService {
  Future<Either<Failure, List<Beer>>> getBeers();
  Future<Either<Failure, List<Beer>>> getSavedBeers();
  Future<Either<Failure, void>> saveBeer(Beer beer);
  Future<Either<Failure, void>> removeFromSavedBeer(int id);
  Future<Either<Failure, void>> update(Beer beer);
}
