import 'package:sqflite/sqflite.dart';

import '../../../core/errors/exceptions.dart';
import '../../model/beer_model.dart';
import 'local_datasource.dart';

class LocalDataSourceImpl extends LocalDatasource {
  late Database _database;

  static const QUERY = 'beers';

  @override
  Future<void> onInit() async {
    _database = await openDatabase(
      'beer_database.db',
      onCreate: (db, _) => db.execute(
        'CREATE TABLE $QUERY(id INTEGER PRIMARY KEY, name TEXT NOT NULL, tagline TEXT NOT NULL, firstBrewed TEXT NOT NULL, description TEXT NOT NULL, imageUrl TEXT NOT NULL, abv INTEGER NOT NULL, ibu INTEGER NOT NULL, targetFg INTEGER NOT NULL, targetOg INTEGER NOT NULL, ebc INTEGER, srm INTEGER, ph INTEGER, attenuationLevel INTEGER NOT NULL)',
      ),
    );
  }

  @override
  Future<List<BeerModel>> getSavedBeers() async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(QUERY);

      return List.generate(maps.length, (i) {
        return BeerModel.fromMap(maps[i]);
      });
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> saveBeer(BeerModel beer) async {
    await _database.insert(
      QUERY,
      beer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> onDestroy() async {
    await _database.close();
  }

  @override
  Future<void> removeBeer(int id) async {
    await _database.delete(
      QUERY,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
