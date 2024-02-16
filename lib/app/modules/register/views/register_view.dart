import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
              key: controller.formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.namaController,
                    decoration: InputDecoration(
                      hintText: 'Nama',
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Nama';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.telpController,
                    decoration: InputDecoration(
                      hintText: 'No Telepon',
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'No Telepon';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.alamatController,
                    decoration: InputDecoration(
                      hintText: 'Alamat',
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Alamat';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                      onPressed: () {
                        controller.register();
                      },
                      child: Text('Tambah'))),
                  SizedBox(height: 10,),
                  TextButton(onPressed: () => Get.back(), child: Text("Sudah Punya Akun"))
                ],
              )),
        ),
      ),
    );
  }
}
