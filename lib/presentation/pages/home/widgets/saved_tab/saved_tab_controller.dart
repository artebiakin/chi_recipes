import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/beer.dart';
import '../../../../../domain/repositories/beer_repository.dart';
import '../../../../../routes/app_pages.dart';
import '../../../details/model/details_args.dart';

class SavedTabController extends GetxController with StateMixin<List<Beer>> {
  var DURATION_ANIMATION = const Duration(milliseconds: 250);

  final _beerRepository = Get.find<BeerRepository>();

  List<Beer> beers = [];
  final removedBeers = <Beer>[].obs;

  bool isVisible(int id) =>
      removedBeers.firstWhereOrNull((element) => element.id == id) == null;

  @override
  void onReady() {
    _loadBeers();
    super.onReady();
  }

  @override
  void onInit() {
    _loadBeers();
    super.onInit();
  }

  Future<void> _loadBeers() async {
    change([], status: RxStatus.loading());

    final response = await _beerRepository.getSavedBeers();

    response.fold(
      (left) => change(beers, status: RxStatus.error()),
      (right) {
        beers = right;
        return change(beers, status: RxStatus.success());
      },
    );
  }

  void onRefresh() {
    _loadBeers();
  }

  void goToDetails(int id) {
    final beer = beers.firstWhere((element) => element.id == id);

    Get.toNamed(Routes.DETAILS,
        arguments: DetailsArgs(beer: beer, isEditMode: true));
  }

  void remove(int id) async {
    await _beerRepository.removeFromSavedBeer(id);
    _animateRemove(id);
  }

  void _animateRemove(int id) {
    _runAnimation(id);
    _removeFromThree(id);
  }

  void _runAnimation(int id) {
    final beer = beers.firstWhere((element) => element.id == id);
    removedBeers.add(beer);
  }

  void _removeFromThree(int id) async {
    await Future.delayed(DURATION_ANIMATION);
    beers = beers.where((element) => element.id != id).toList();
    return change(beers, status: RxStatus.success());
  }
}
