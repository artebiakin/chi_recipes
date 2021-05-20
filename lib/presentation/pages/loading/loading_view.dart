import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset('assets/img/raster/Hi_Blob.png'),
            const Text(
              'Mediacom',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ).paddingOnly(bottom: 20.0)
          ],
        ),
      ),
    );
  }
}
