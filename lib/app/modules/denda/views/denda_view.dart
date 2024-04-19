import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/denda_controller.dart';

class DendaView extends GetView<DendaController> {
  const DendaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BgColor,
        elevation: 0,
        title: Text("DendaView"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'DendaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
