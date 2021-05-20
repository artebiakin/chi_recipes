import 'package:get/get.dart';

import '../presentation/index.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOADING;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingView(),
      binding: LoadingBinding(),
    ),
  ];
}
