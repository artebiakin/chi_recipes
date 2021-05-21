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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Beer &&
        other.id == id &&
        other.name == name &&
        other.tagline == tagline &&
        other.firstBrewed == firstBrewed &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.abv == abv &&
        other.ibu == ibu &&
        other.targetFg == targetFg &&
        other.targetOg == targetOg &&
        other.ebc == ebc &&
        other.srm == srm &&
        other.ph == ph &&
        other.attenuationLevel == attenuationLevel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        tagline.hashCode ^
        firstBrewed.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        abv.hashCode ^
        ibu.hashCode ^
        targetFg.hashCode ^
        targetOg.hashCode ^
        ebc.hashCode ^
        srm.hashCode ^
        ph.hashCode ^
        attenuationLevel.hashCode;
  }

  Beer copyWith({
    int? id,
    String? name,
    String? tagline,
    DateTime? firstBrewed,
    String? description,
    String? imageUrl,
    double? abv,
    double? ibu,
    int? targetFg,
    double? targetOg,
    int? ebc,
    double? srm,
    double? ph,
    double? attenuationLevel,
  }) {
    return Beer(
      id: id ?? this.id,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      firstBrewed: firstBrewed ?? this.firstBrewed,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      abv: abv ?? this.abv,
      ibu: ibu ?? this.ibu,
      targetFg: targetFg ?? this.targetFg,
      targetOg: targetOg ?? this.targetOg,
      ebc: ebc ?? this.ebc,
      srm: srm ?? this.srm,
      ph: ph ?? this.ph,
      attenuationLevel: attenuationLevel ?? this.attenuationLevel,
    );
  }
}
