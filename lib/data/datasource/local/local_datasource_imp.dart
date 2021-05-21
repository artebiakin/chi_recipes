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
        'CREATE TABLE $QUERY(id INTEGER PRIMARY KEY, name TEXT NOT NULL, tagline TEXT NOT NULL, first_brewed TEXT NOT NULL, description TEXT NOT NULL, image_url TEXT NOT NULL, abv INTEGER NOT NULL, ibu INTEGER NOT NULL, target_fg INTEGER NOT NULL, target_og INTEGER NOT NULL, ebc INTEGER, srm INTEGER, ph INTEGER, attenuation_level INTEGER NOT NULL)',
      ),
      version: 1,
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

  @override
  Future<void> update(BeerModel beer) async {
    await _database.update(
      QUERY,
      beer.toMap(),
      where: 'id = ?',
      whereArgs: [beer.id],
    );
  }
}
