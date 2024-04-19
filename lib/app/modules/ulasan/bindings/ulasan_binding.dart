import 'package:get/get.dart';

import '../controllers/ulasan_controller.dart';

class UlasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UlasanController>(
      () => UlasanController(),
    );
  }
}
