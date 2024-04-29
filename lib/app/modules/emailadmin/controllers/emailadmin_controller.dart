import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_user.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/SharedPreferencesKeys.dart';

class EmailadminController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;
  Rx<DataUser?> user = Rx<DataUser?>(null);
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  sendEmail () async{

    // String subject, String body, String recipientemail;
    String subject = subjectController.text;
    String body = bodyController.text;
    String recipientemail = 'hafizpratama0809@gmail.com';
    final Email email = Email(
      body:body,
      subject:subject,
      recipients: [recipientemail],
      //cc : ['cc@example.com'],
      //bcc : ['bcc@example.com'],
      //attachmentPaths : ['/path/to/attachment.zip'],
      isHTML: false
    );

    await FlutterEmailSender.send(email);
  }

  Future<void> getData() async {
    try {
      // Ambil token JWT dari penyimpanan lokal
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);

      // Lakukan permintaan GET dengan header yang disertakan
      final response = await ApiProvider.instance().get(
        Endpoint.user,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Periksa apakah respons sukses (status code 200)
      if (response.statusCode == 200) {
        final ResponseUser responseUser = ResponseUser.fromJson(response.data);
        if (responseUser.data != null) {
          user.value = responseUser.data;
        } else {
          Get.snackbar('Error', 'Response data is null',
              backgroundColor: Colors.red);
        }
      } else {
        // Tangani jika permintaan tidak berhasil
        // Misalnya, tampilkan pesan kesalahan kepada pengguna
        Get.snackbar('Error', 'Failed to fetch user data',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      // Tangani kesalahan jika terjadi
      // Misalnya, tampilkan pesan kesalahan kepada pengguna
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.red);
    }
  }

}
