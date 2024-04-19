import 'package:bukubuku_2/app/data/model/response_koleksi.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/SharedPreferencesKeys.dart';

class KoleksiController extends GetxController {
  RxList<DataKoleksi>? books = <DataKoleksi>[].obs;
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

  Future<void> getData() async {
    loading(true);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString(SharedPreferencesKeys.userId);
      String? token = prefs.getString(SharedPreferencesKeys.token);
      final response = await ApiProvider.instance().get(
        '${Endpoint.koleksi}/$userid',

        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final ResponseKoleksi responseBook = ResponseKoleksi.fromJson(response.data);
        if (responseBook.data != null) {
          books!.value = responseBook.data! as List<DataKoleksi>;
          // Lakukan sesuatu dengan judul buku yang telah dimuat dari server
        } else {
          // Handle case where data is empty for the selected category
          Get.snackbar('Error', 'Data buku kosong untuk kategori yang dipilih', backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'Gagal mengambil data: ${response.data['message']}', backgroundColor: Colors.red);
      }
    } on dio.DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        books!.value = <DataKoleksi>[];

        // Get.snackbar('Error', 'Gagal mengambil data: ${e.response?.data['message']}', backgroundColor: Colors.red);
      } else {
        Get.snackbar('Error', 'Kesalahan terjadi: ${e.message ?? ""}', backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'Kesalahan terjadi: $e', backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }


  Future<void> deleteData(int? id) async {
    loading(false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString(SharedPreferencesKeys.token);

      final response = await ApiProvider.instance().delete(
        '${Endpoint.koleksi}/$id', // Endpoint untuk menghapus data dengan ID tertentu
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Jika penghapusan berhasil, perbarui status dan lakukan tindakan yang sesuai
        Get.snackbar('Berhasil','Koleksi buku berhasil dihapus', backgroundColor: Colors.green);
      } else {
        // Jika penghapusan gagal, tampilkan pesan kesalahan
        Get.snackbar('Error', 'Kesalahan terjadi: Gagal mengapus koleksi', backgroundColor: Colors.red);
      }
    } catch (e) {
      // Jika terjadi kesalahan selama proses penghapusan, tampilkan pesan kesalahan
      Get.snackbar('Error', 'Kesalahan terjadi: $e', backgroundColor: Colors.red);
    }
  }

}