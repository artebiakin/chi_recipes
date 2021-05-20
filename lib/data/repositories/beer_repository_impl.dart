import '../../core/errors/failure.dart';
import '../../domain/entities/beer.dart';
import '../../domain/repositories/beer_repository.dart';
import '../datasource/local/local_datasource.dart';
import '../datasource/remote/remote_datasource.dart';
import '../model/beer_model.dart';

class BeerRepositoryImpl extends BeerRepository {
  BeerRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final LocalDatasource localDatasource;
  final RemoteDatasource remoteDatasource;

  @override
  Future<List<Beer>> getBeers() async {
    try {
      final response = await remoteDatasource.getBeer();

      return response.map((e) => e.toDomain()).toList();
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<List<Beer>> getSavedBeers() async {
    try {
      final response = await localDatasource.getSavedBeers();
      return response.map((e) => e.toDomain()).toList();
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> removeFromSavedBeer(int id) async {
    try {
      await localDatasource.removeBeer(id);
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> saveBeer(Beer beer) async {
    try {
      await localDatasource.saveBeer(BeerModel.fromDomain(beer));
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
