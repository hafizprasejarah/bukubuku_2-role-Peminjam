
import 'package:bukubuku_2/app/data/model/response_user.dart';
import 'package:bukubuku_2/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

import '../../../routes/SharedPreferencesKeys.dart';

class HomeController extends GetxController {
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


  void getData() async {

    try {
      // Ambil token JWT dari penyimpanan lokal
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userId = prefs.getString(SharedPreferencesKeys.userId);

      if (token != null) {
        bool hasExpired = JwtDecoder.isExpired(token!);

        print(hasExpired);
        if(hasExpired){
          print(hasExpired);
          Get.offAllNamed(Routes.LOGIN);
        }

      }



      // Lakukan permintaan GET dengan header yang disertakan
      final response = await ApiProvider.instance().get(
        Endpoint.user,
        options: Options(
          headers:{
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Periksa apakah respons sukses (status code 200)
      if (response.statusCode == 200) {
        // Proses data pengguna dari respons
        final ResponseUser responseUser = ResponseUser.fromJson(response.data);
        user.value = responseUser.data;
        print(responseUser.data);
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

