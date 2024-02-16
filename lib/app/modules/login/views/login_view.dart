import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        hintText: 'Masukan username',
                      ),
                      validator: (value) {
                        if (value!.length < 2) {
                          return 'Masukan Username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Masukan passwrod',
                      ),
                      validator: (value) {
                        if (value!.length < 2) {
                          return 'Masukan password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Obx(() => controller.loading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        child: Text('Login'))),
                    SizedBox(height: 10,),
                    TextButton( onPressed: () => Get.toNamed(Routes.REGISTER) , child: Text("Open register"))
                  ],
                ))),
      ),
    );
  }
}
