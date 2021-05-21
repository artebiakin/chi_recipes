import 'package:get/get.dart';

import '../../../../../domain/entities/beer.dart';
import '../../../../../domain/repositories/beer_repository.dart';
import '../../../../../routes/app_pages.dart';
import '../../../details/model/details_args.dart';

class MainTabController extends GetxController with StateMixin<List<Beer>> {
  final _beerRepository = Get.find<BeerRepository>();

  List<Beer> beers = [];

  @override
  void onInit() {
    _loadBeers();
    super.onInit();
  }

  Future<void> _loadBeers() async {
    change([], status: RxStatus.loading());

    final response = await _beerRepository.getBeers();

    response.fold(
      (left) => change(beers, status: RxStatus.error()),
      (right) {
        beers = right;
        return change(beers, status: RxStatus.success());
      },
    );
  }

  void goToDetails(int id) {
    final beer = beers.firstWhere((element) => element.id == id);

    Get.toNamed(Routes.DETAILS, arguments: DetailsArgs(beer: beer));
  }
}
