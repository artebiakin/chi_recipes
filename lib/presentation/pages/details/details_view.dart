import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            expandedHeight: height,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => controller.isFavorite
                      ? IconButton(
                          onPressed: controller.removeFromFavorite,
                          icon: const Icon(Icons.favorite))
                      : IconButton(
                          onPressed: controller.addToFavorite,
                          icon: const Icon(Icons.favorite_outline),
                        ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.bottomLeft,
                child: Obx(
                  () => Text(
                    controller.beer.name,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              background: CachedNetworkImage(
                imageUrl: controller.beer.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SafeArea(
                top: false,
                minimum: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Wrap(
                        spacing: 10,
                        children: [
                          _Label(text: 'ABV: ${controller.beer.abv}'),
                          _Label(text: 'EBC: ${controller.beer.ebc}'),
                          _Label(text: 'IBU: ${controller.beer.ibu}'),
                          _Label(text: 'PH: ${controller.beer.ph}'),
                          _Label(text: 'SRM: ${controller.beer.srm}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      child: Column(
                        children: [
                          Text(controller.beer.description),
                        ],
                      ),
                    ),
                    Text('#${controller.beer.tagline.toUpperCase()}'),
                    Text(controller.beer.attenuationLevel.toString()),
                    Text(controller.beer.firstBrewed.toString()),
                    const SizedBox(height: 35),
                    if (controller.isEditMode)
                      OutlinedButton(
                        onPressed: controller.onEdit,
                        child: const Text('Edit name'),
                      ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          width: 1,
          color: Theme.of(context).accentColor,
        ),
      ),
      child: Text(text),
    );
  }
}
