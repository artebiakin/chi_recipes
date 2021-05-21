import '../../../../domain/entities/beer.dart';

class DetailsArgs {
  const DetailsArgs({
    required this.beer,
    this.isEditMode = false,
  });

  final Beer beer;
  final bool isEditMode;
}
