import 'package:bukubuku_2/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/SharedPreferencesKeys.dart';

class BookDetailController extends GetxController {


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> deleteData(int? id) async {
    try {
      final token = await StorageProvider.read(StorageKey.token);
      final response = await ApiProvider.instance().delete(
        '${Endpoint.book}/$id', // Endpoint untuk menghapus data dengan ID tertentu
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Jika penghapusan berhasil, tampilkan snackbar sukses
        Get.snackbar(
          'Success',
          'Buku berhasil dihapus',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(Routes.BOOK_LIST);
      } else {
        // Jika penghapusan gagal, tampilkan snackbar error
        Get.snackbar(
          'Error',
          'Failed to delete data',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Jika terjadi kesalahan selama proses penghapusan, tampilkan snackbar error dengan pesan kesalahan
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  Future<void> addKoleksi(String? bookID) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userid = prefs.getString(SharedPreferencesKeys.userId);

      Map<String, dynamic> userData = {
        'user_id':  userid,
        'book_id':  bookID
      };

      final response = await ApiProvider.instance().post(
        Endpoint.koleksi,
        data: dio.FormData.fromMap(userData),
        options: Options(
          headers:{
            'Authorization': 'Bearer $token',
          },
        ),// Menggunakan dio.FormData
      );

      if (response.statusCode == 201) {
        Get.snackbar("Berhasil", "Buku telah di tambahkan ke koleksi", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Sorry", "Gagal", backgroundColor: Colors.orange);
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("sorry", "Buku sudah ada di koleksi", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("error", e.toString(), backgroundColor: Colors.red);
    }
  }


}
