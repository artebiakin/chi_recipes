import 'dart:ffi';

import 'package:either_dart/either.dart';

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
  Future<Either<Failure, List<Beer>>> getBeers() async {
    try {
      final response = await remoteDatasource.getBeer();

      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Beer>>> getSavedBeers() async {
    try {
      final response = await localDatasource.getSavedBeers();
      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromSavedBeer(int id) async {
    try {
      await localDatasource.removeBeer(id);
      return const Right(Void);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveBeer(Beer beer) async {
    try {
      await localDatasource.saveBeer(BeerModel.fromDomain(beer));
      return const Right(Void);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> update(Beer beer) async {
    try {
      await localDatasource.update(BeerModel.fromDomain(beer));
      return const Right(Void);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
