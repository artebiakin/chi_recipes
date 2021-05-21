import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_tab_controller.dart';

class MainTabView extends GetView<MainTabController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (posts) => GridView.builder(
        padding: const EdgeInsets.only(top: 9),
        itemCount: posts!.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.goToDetails(posts[index].id),
            child: Container(
              width: 100,
              height: 100,
              child: CachedNetworkImage(imageUrl: posts[index].imageUrl),
            ),
          );
        },
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
