import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ulasan_controller.dart';

class UlasanView extends GetView<UlasanController> {
  const UlasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UlasanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UlasanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
