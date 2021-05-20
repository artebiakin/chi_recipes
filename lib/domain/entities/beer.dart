class Beer {
  const Beer({
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
    this.ebc,
    this.srm,
    this.ph,
    required this.attenuationLevel,
  });

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
}
