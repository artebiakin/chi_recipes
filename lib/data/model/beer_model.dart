import 'dart:convert';

import 'package:intl/intl.dart';

import '../../domain/entities/beer.dart';

class BeerModel {
  const BeerModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.firstBrewed,
    required this.description,
    required this.imageUrl,
    required this.abv,
    required this.ibu,
    required this.targetFg,
    required this.targetOg,
    required this.attenuationLevel,
    this.srm,
    this.ebc,
    this.ph,
  });

  factory BeerModel.fromDomain(Beer beer) {
    return BeerModel(
      id: beer.id,
      name: beer.name,
      tagline: beer.tagline,
      firstBrewed: beer.firstBrewed,
      description: beer.description,
      imageUrl: beer.imageUrl,
      abv: beer.abv,
      ibu: beer.ibu,
      targetFg: beer.targetFg,
      targetOg: beer.targetOg,
      ebc: beer.ebc,
      srm: beer.srm,
      ph: beer.ph,
      attenuationLevel: beer.attenuationLevel,
    );
  }

  factory BeerModel.fromMap(Map<String, dynamic> map) {
    return BeerModel(
        id: map['id'],
        name: map['name'],
        tagline: map['tagline'],
        firstBrewed: DateFormat('MM/yyyy').parse(map['first_brewed']),
        description: map['description'],
        imageUrl: map['image_url'],
        abv: double.parse(map['abv'].toString()),
        ibu: double.parse(map['ibu'].toString()),
        targetFg: map['target_fg'],
        targetOg: double.parse(map['target_og'].toString()),
        ebc: map['ebc'],
        srm: double.tryParse(map['srm'].toString()),
        ph: map['ph'],
        attenuationLevel: double.parse(map['attenuation_level'].toString()));
  }

  factory BeerModel.fromJson(String source) =>
      BeerModel.fromMap(json.decode(source));

  final int id;
  final String name;
  final String tagline;
  final DateTime firstBrewed;
  final String description;
  final String imageUrl;
  final double abv;
  final double ibu;
  final int targetFg;
  final double targetOg;
  final int? ebc;
  final double? srm;
  final double? ph;
  final double attenuationLevel;

  Beer toDomain() {
    return Beer(
      id: id,
      name: name,
      tagline: tagline,
      firstBrewed: firstBrewed,
      description: description,
      imageUrl: imageUrl,
      abv: abv,
      ibu: ibu,
      targetFg: targetFg,
      targetOg: targetOg,
      ebc: ebc,
      srm: srm,
      ph: ph,
      attenuationLevel: attenuationLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'first_brewed': '${firstBrewed.month}/${firstBrewed.year}',
      'description': description,
      'image_url': imageUrl,
      'abv': abv,
      'ibu': ibu,
      'target_fg': targetFg,
      'target_og': targetOg,
      'ebc': ebc,
      'srm': srm,
      'ph': ph,
      'attenuation_level': attenuationLevel,
    };
  }

  String toJson() => json.encode(toMap());
}
