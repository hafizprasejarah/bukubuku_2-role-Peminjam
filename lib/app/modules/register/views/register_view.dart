import 'package:bukubuku_2/app/modules/user/views/Imagepicker/inputDecoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/views/togglepassword.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('RegisterView'),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: controller.formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "REGISTER",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.namaController,
                    decoration: AppDecorations.textFormFieldDecoration.copyWith(
                      hintText: 'Nama',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan Nama';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: AppDecorations.textFormFieldDecoration.copyWith(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: AppDecorations.textFormFieldDecoration.copyWith(
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan Username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.telpController,
                    decoration: AppDecorations.textFormFieldDecoration.copyWith(
                      hintText: 'No Telepon',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan No Telepon';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.alamatController,
                    decoration: AppDecorations.textFormFieldDecoration.copyWith(
                      hintText: 'Alamat',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan Alamat';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TogglePassword(controller: controller.passwordController),
                  SizedBox(height: 20),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Warna latar belakang tombol
                      onPrimary: Colors.white, // Warna teks pada tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Mengatur sudut border tombol
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Padding dalam tombol
                    ),
                    child: Text(
                      'Tambah',
                      style: TextStyle(
                        fontSize: 16, // Ukuran teks
                        fontWeight: FontWeight.bold, // Ketebalan teks
                      ),
                    ),
                  )
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text("Sudah Punya Akun"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
