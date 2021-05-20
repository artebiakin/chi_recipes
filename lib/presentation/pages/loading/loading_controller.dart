import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoadingController extends GetxController {
  @override
  Future onInit() async {
    super.onInit();

    await Future.delayed(const Duration(seconds: 2));

    return Get.offAndToNamed(Routes.HOME);
  }
}
