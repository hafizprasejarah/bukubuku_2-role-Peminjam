import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/SharedPreferencesKeys.dart';
import '../../../routes/app_pages.dart';

class PeminjamanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController tglpinjamController = TextEditingController();
  final TextEditingController tglkembaliController = TextEditingController();
  final loading = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  pinjam(int? bookid) async {
    loading(true);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userid = prefs.getString(SharedPreferencesKeys.userId);


      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.pinjam,
          data: ({
            "tanggal_pinjam": tglpinjamController.text.toString(),
            "tanggal_kembali": tglkembaliController.text.toString(),
            "user_id": userid,
            "book_id": bookid
          }),
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Berhasil meminjam",
              backgroundColor: Colors.green);
        } else {
          Get.snackbar("Sorry", "Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null)
          Get.snackbar("sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
      } else {
        Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("error", e.toString(), backgroundColor: Colors.red);
    }
  }

  checkAuth() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferencesKeys.token);
    String? userid = prefs.getString(SharedPreferencesKeys.userId);
    if (token != null) {
      bool hasExpired = JwtDecoder.isExpired(token!);

      print(hasExpired);
      if(hasExpired){
        print(hasExpired);
        Get.offAllNamed(Routes.LOGIN);
      }

    }
  }
}
