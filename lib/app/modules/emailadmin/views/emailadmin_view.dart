import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/emailadmin_controller.dart';

class EmailadminView extends GetView<EmailadminController> {
  const EmailadminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmailadminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmailadminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
