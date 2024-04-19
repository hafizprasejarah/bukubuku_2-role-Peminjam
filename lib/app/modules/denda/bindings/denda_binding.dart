import 'package:get/get.dart';

import '../controllers/denda_controller.dart';

class DendaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DendaController>(
      () => DendaController(),
    );
  }
}
