import 'package:get/get.dart';

import '../controllers/searchtap_controller.dart';

class SearchtapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchtapController>(
      () => SearchtapController(),
    );
  }
}
