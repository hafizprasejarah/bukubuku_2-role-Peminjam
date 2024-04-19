import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';

class SearchtapController extends GetxController {
  RxList<DataBook>? books = <DataBook>[].obs;
  final TextEditingController SearchController = TextEditingController();
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


      final response = await ApiProvider.instance().get(
        '${Endpoint.book}',
      );

      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data != null) {
          books!.value = responseBook.data! as List<DataBook>;
        } else {
          // Handle case where data is empty for the selected category
          Get.snackbar('Error', 'Data buku kosong untuk kategori yang dipilih', backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'Gagal mengambil data: ${response.data['message']}', backgroundColor: Colors.red);
      }
    } on dio.DioException catch (e) {

      if (e.response != null && e.response?.data != null) {
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



  void UpdateList() async{
    try {
      String TextValue = SearchController.text;

      final response = await ApiProvider.instance().get(
        '${Endpoint.search}?judul=$TextValue',
      );

      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data != null) {
          books!.value = responseBook.data! as List<DataBook>;
        } else {
          // Handle case where data is empty for the selected category
          Get.snackbar('Error', 'Data buku kosong untuk kategori yang dipilih', backgroundColor: Colors.red);
        }
      } else {
        // Tampilkan pesan error jika terjadi kesalahan saat mencari
        Get.snackbar('Error', 'Gagal melakukan pencarian: ${response.data['message']}', backgroundColor: Colors.red);
      }
    } catch (e) {
      // Tangani kesalahan jika terjadi kesalahan saat melakukan permintaan API
      Get.snackbar('Error', 'Kesalahan terjadi saat melakukan pencarian: $e', backgroundColor: Colors.red);
    }
  }
}
