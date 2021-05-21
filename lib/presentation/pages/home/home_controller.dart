import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/network/app_settings.dart';
import '../../../utils/theme/theme_data.dart';
import 'model/custom_tab.dart';
import 'widgets/main_tab/main_tab_view.dart';
import 'widgets/saved_tab/saved_tab_view.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  final tabs = [
    CustomTab(
      screen: MainTabView(),
      name: 'Global',
    ),
    CustomTab(
      screen: SavedTabView(),
      name: 'Saved',
    ),
  ];
  late final StreamSubscription<ConnectivityResult> subscription;
  late final _connectivityResult =
      Rx<ConnectivityResult>(AppSettings.connectivity);

  ConnectivityResult get connectivityResult => _connectivityResult.value;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: tabs.length);

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _connectivityResult.value = result;
      displayNetworkStatus();
    });

    super.onInit();
  }

  @override
  void onReady() {
    displayNetworkStatus();
    super.onReady();
  }

  void displayNetworkStatus() {
    if (Get.isSnackbarOpen ?? false) {
      Get.back();
    }
    if (connectivityResult == ConnectivityResult.none) {
      Get.showSnackbar(
        GetBar(
          messageText: Center(
            child: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: AppColors.white,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: 'No internet access. ',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Go to Saved'.toUpperCase(),
                        recognizer: TapGestureRecognizer()..onTap = goToSaved,
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.red,
          overlayColor: AppColors.red,
          snackStyle: SnackStyle.GROUNDED,
        ),
      );
    }
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  void goToSaved() {
    tabController.animateTo(1);
  }
}
