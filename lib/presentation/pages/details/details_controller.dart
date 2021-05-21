import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../../../domain/entities/beer.dart';
import '../../../domain/repositories/beer_repository.dart';
import '../../../routes/app_pages.dart';
import '../home/widgets/saved_tab/saved_tab_controller.dart';
import 'model/details_args.dart';

class DetailsController extends GetxController {
  final BeerRepository beerRepository = Get.find();
  final _beer = (Get.arguments as DetailsArgs).beer.obs;
  final isEditMode = (Get.arguments as DetailsArgs).isEditMode;

  final _favoriteBeers = <Beer>[].obs;

  Beer get beer => _beer.value;

  @override
  void onInit() async {
    (await beerRepository.getSavedBeers()).fold(
      (left) => _favoriteBeers.value = <Beer>[],
      (right) => _favoriteBeers.value = right,
    );
    super.onInit();
  }

  void addToFavorite() {
    _favoriteBeers.add(beer);
    beerRepository.saveBeer(beer);
    _refresh();
  }

  void removeFromFavorite() {
    _favoriteBeers.remove(beer);
    beerRepository.removeFromSavedBeer(beer.id);
    _refresh();
  }

  void _refresh() => Get.find<SavedTabController>().onRefresh();

  bool get isFavorite {
    if (_favoriteBeers.isEmpty) return false;

    return _favoriteBeers
            .firstWhereOrNull((element) => element.id == beer.id) !=
        null;
  }

  void onEdit() async {
    final newBeer = await Get.toNamed(Routes.EDIT, arguments: beer);

    if (newBeer != null) _beer.value = newBeer;
  }
}
