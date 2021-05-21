import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'saved_tab_controller.dart';

class SavedTabView extends GetView<SavedTabController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (posts) => GridView.builder(
        padding: const EdgeInsets.only(top: 9),
        itemCount: posts!.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Obx(
            () => AnimatedOpacity(
              duration: controller.DURATION_ANIMATION,
              opacity: controller.isVisible(posts[index].id) ? 1 : 0,
              child: GestureDetector(
                onLongPress: () => controller.remove(posts[index].id),
                onTap: () => controller.goToDetails(posts[index].id),
                child: Container(
                  width: 100,
                  height: 100,
                  child: CachedNetworkImage(imageUrl: posts[index].imageUrl),
                ),
              ),
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
