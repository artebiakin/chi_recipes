import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.tabs
              .map(
                (e) => Tab(text: e.name),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: controller.tabs.map((e) => e.screen).toList(),
      ),
    );
  }
}
