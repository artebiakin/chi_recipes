import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(
          () => controller.isProcessing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextField(
                      controller: controller.textEditingController,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            onPressed: controller.onDiscard,
                            child: const Text('Discard')),
                        const SizedBox(width: 45),
                        ElevatedButton(
                            onPressed: controller.onUpdate,
                            child: const Text('Update')),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
