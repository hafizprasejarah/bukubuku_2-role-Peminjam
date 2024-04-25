import 'package:bukubuku_2/app/data/model/response_book.dart';
import 'package:bukubuku_2/app/data/model/response_kategori.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class BookListController extends GetxController {
  RxList<DataBook>? books = <DataBook>[].obs;
  final TextEditingController SearchController = TextEditingController();
  RxList<DataKategori>? kategori = <DataKategori>[].obs;
  String kategori2 = '';
  final loading = false.obs;
  final count = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxInt Index = 0.obs;

  void updateSelectedIndex(int index) {
      selectedIndex.value = index;
      Index.value = index;
  }

  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    getData(null);
    getDataKategori();
    pageController = PageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  // Future<void> getData(String? kategori) async {
  //   try {
  //     if(kategori == null){
  //       kategori = "tidak dikategorikan";
  //     }
  //
  //     // Lakukan permintaan GET dengan header yang disertakan
  //     final response = await ApiProvider.instance().get(
  //      '${Endpoint.book}?kategori=${kategori}',
  //     );
  //
  //     // Periksa apakah respons sukses (status code 200)
  //     if (response.statusCode == 200) {
  //       final ResponseBook responseBook = ResponseBook.fromJson(response.data);
  //       if (responseBook.data != null) {
  //         books!.value = responseBook.data! as List<DataBook>;
  //       } else {
  //         Get.snackbar('Error', 'Response data kosong',
  //             backgroundColor: Colors.red);
  //       }
  //     } else {
  //       Get.snackbar('Error', 'Failed',
  //           backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //
  //     Get.snackbar('Error', 'Kesalahan Terjadi: $e',
  //         backgroundColor: Colors.red);
  //   }
  // }

  Future<void> getData(String? kategori) async {
    loading(true);
    try {
      if (kategori == null) {
        kategori = "tidak dikategorikan";
      }
// Menunda eksekusi selama 1 detik sebelum melakukan permintaan API
//       await Future.delayed(Duration(milliseconds: 100));

      final response = await ApiProvider.instance().get(
        '${Endpoint.book}?kategori=$kategori',
      );

      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data != null) {
          books!.value = responseBook.data! as List<DataBook>;
          kategori2 = kategori;
        } else {
          // Handle case where data is empty for the selected category
          Get.snackbar('Error', 'Data buku kosong untuk kategori yang dipilih', backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'Gagal mengambil data: ${response.data['message']}', backgroundColor: Colors.red);
      }
    } on dio.DioException catch (e) {

      if (e.response != null && e.response?.data != null) {
        books!.value = <DataBook>[];
        kategori2 = kategori!;
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



  Future<void> getDataKategori() async {
    try {

      final response = await ApiProvider.instance().get(
        Endpoint.kategori
      );

      // Periksa apakah respons sukses (status code 200)
      if (response.statusCode == 200) {
        final ResponseKategori responseKategori = ResponseKategori.fromJson(response.data);
        kategori!.value = responseKategori.data as List<DataKategori>;
      } else {
        Get.snackbar('Error', 'Failed',
            backgroundColor: Colors.red);

      }
    } catch (e) {

      Get.snackbar('Error', 'Kesalahan Terjadi: $e',
          backgroundColor: Colors.red);
    }
  }


  void UpdateList() async{
    try {
      String TextValue = SearchController.text;
      // print(' dasdaw : ${TextValue}');
      // Kirim permintaan pencarian ke server menggunakan API
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
