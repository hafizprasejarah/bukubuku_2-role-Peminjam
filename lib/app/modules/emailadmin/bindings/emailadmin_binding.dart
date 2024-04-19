import 'package:get/get.dart';

import '../controllers/emailadmin_controller.dart';

class EmailadminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailadminController>(
      () => EmailadminController(),
    );
  }
}
