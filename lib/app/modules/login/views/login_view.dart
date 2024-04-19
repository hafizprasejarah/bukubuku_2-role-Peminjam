import 'package:bukubuku_2/app/modules/login/views/togglepassword.dart';
import 'package:flutter/material.dart';
import 'package:bukubuku_2/app/modules/user/views/Imagepicker/inputDecoration.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('LOGIN'),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    Text("LOGIN",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),),

                    SizedBox(height: 90,),
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: AppDecorations.textFormFieldDecoration.copyWith(
                        hintText: 'Masukan username',
                      ),
                      validator: (value) {
                        if (value!.length < 2) {
                          return 'Masukan Username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TogglePassword(controller: controller.passwordController),
                    SizedBox(height: 20,),
                    Obx(() => controller.loading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () {
                        controller.login();
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
                        'Login',
                        style: TextStyle(
                          fontSize: 16, // Ukuran teks
                          fontWeight: FontWeight.bold, // Ketebalan teks
                        ),
                      ),
                    )
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            'klik sini',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ))),
      ),
    );
  }
}





