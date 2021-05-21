import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/beer.dart';
import '../../../../domain/repositories/beer_repository.dart';
import '../../home/widgets/saved_tab/saved_tab_controller.dart';

class EditController extends GetxController {
  final BeerRepository beerRepository = Get.find();
  late final TextEditingController textEditingController;
  final beer = Get.arguments as Beer;

  final Rx<bool> _isProcessing = Rx(false);

  bool get isProcessing => _isProcessing.value;

  @override
  void onInit() {
    textEditingController = TextEditingController(text: beer.name);
    super.onInit();
  }

  void onDiscard() {
    Get.back();
  }

  void onUpdate() async {
    _isProcessing.value = true;
    final newBeer = beer.copyWith(name: textEditingController.text);
    await beerRepository.update(newBeer);
    Get.find<SavedTabController>().onRefresh();
    _isProcessing.value = false;
    Get.back(result: newBeer);
  }
}
