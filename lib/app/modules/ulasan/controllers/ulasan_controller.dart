import 'package:bukubuku_2/app/data/model/response_listUlasan.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_ulasan.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/SharedPreferencesKeys.dart';
import '../../book_detail/controllers/book_detail_controller.dart';

class UlasanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController ulasanController = TextEditingController();
  int rating = 0;
  int bookID= Get.find<BookDetailController>().getBookId();
  RxList<DataUlasanList?> ulasan = <DataUlasanList?>[].obs;
  final loading = false.obs;
  final count = 0.obs;



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

  Ulasan(int? bookid,double? rating) async {
    loading(true);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userid = prefs.getString(SharedPreferencesKeys.userId);


      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.ulasan,
          data: ({
            "ulasan": ulasanController.text,
            "rating": rating!.toInt(),
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


  Future<void> getData() async {
    try {
      // Ambil token JWT dari penyimpanan lokal
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userid = prefs.getString(SharedPreferencesKeys.userId);
      // Lakukan permintaan GET dengan header yang disertakan
      final response = await ApiProvider.instance().get(
        Endpoint.ulasan+'/$bookID',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Periksa apakah respons sukses (status code 200)
      if (response.statusCode == 200) {
        final ResponseListUlasan responseUser = ResponseListUlasan.fromJson(response.data);
        if (responseUser.data != null) {
          ulasan.value = responseUser.data as List<DataUlasanList?>;
          update();
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


  Future<void> deleteData(num? id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userid = prefs.getString(SharedPreferencesKeys.userId);
      final response = await ApiProvider.instance().delete(
        '${Endpoint.ulasan}/$id', // Endpoint untuk menghapus data dengan ID tertentu
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        ulasan.removeWhere((ulasan) => ulasan?.id == id);
        update();
      } else {
        // Jika penghapusan gagal, tampilkan pesan kesalahan
        Get.snackbar('gagal','Gagal Menghapus data',
            backgroundColor: Colors.orange);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.red);
    }
  }
}
