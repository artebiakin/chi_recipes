import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'injection_container.dart' as di;
import 'routes/app_pages.dart';
import 'utils/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(
    GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: lightThemeData,
      onDispose: di.destroy,
    ),
  );
}
