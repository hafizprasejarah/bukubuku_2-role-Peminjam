import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../user/views/Imagepicker/inputDecoration.dart';
import '../controllers/emailadmin_controller.dart';

class EmailadminView extends GetView<EmailadminController> {
  const EmailadminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: BgColor,
      title: Text(
        "Hubungi Admin",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white, // Warna teks putih
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Get.offAllNamed(Routes.HOME);
        },
      ),
    ),
      body: Obx(() {

        if(controller.user.value != null){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: controller.formkey,
                child: Column(
                  children: [

                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 360,
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey, // Atur warna border sesuai kebutuhan
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        'hafizpratama0809@gmail.com',
                        style: TextStyle(
                          fontSize: 16, // Atur ukuran teks sesuai kebutuhan
                          color: Colors.black, // Atur warna teks sesuai kebutuhan
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.subjectController,
                      decoration:
                      AppDecorations.textFormFieldDecoration.copyWith(
                        labelText: 'Masukan subject',
                        hintText: 'Masukan subject',
                      ),
                      validator: (value) {
                        if (value!.length < 2) {
                          return 'Masukan Subject';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controller.bodyController,
                      maxLines: null,
                      decoration: AppDecorations.textFormFieldDecoration.copyWith(
                        hintText: 'Masukan body...',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => controller.loading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () {
                        // print('${controller.emailController.text}');
                        controller.sendEmail();
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                        Colors.blue, // Warna latar belakang tombol
                        onPrimary: Colors.white, // Warna teks pada tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Mengatur sudut border tombol
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8), // Padding dalam tombol
                      ),
                      child: Text(
                        'Kirim',
                        style: TextStyle(
                          fontSize: 16, // Ukuran teks
                          fontWeight: FontWeight.bold, // Ketebalan teks
                        ),
                      ),
                    )),
                  ],
                )),
          );
        }else{
          return Center(child: const CircularProgressIndicator());
        }
      }),
    );
  }
}
