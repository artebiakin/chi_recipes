import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

import '../../../core/network/app_settings.dart';
import '../../../routes/app_pages.dart';

class LoadingController extends GetxController {
  @override
  Future onInit() async {
    super.onInit();

    AppSettings.connectivity = await Connectivity().checkConnectivity();
    await Future.delayed(const Duration(seconds: 1));

    return Get.offAndToNamed(Routes.HOME);
  }
}
