import 'package:get/get.dart';

import 'home_controller.dart';
import 'widgets/main_tab/main_tab_controller.dart';
import 'widgets/saved_tab/saved_tab_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<MainTabController>(MainTabController());
    Get.put<SavedTabController>(SavedTabController());
  }
}
