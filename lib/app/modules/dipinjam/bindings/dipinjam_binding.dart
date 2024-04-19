import 'package:get/get.dart';

import '../controllers/dipinjam_controller.dart';

class DipinjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DipinjamController>(
      () => DipinjamController(),
    );
  }
}
