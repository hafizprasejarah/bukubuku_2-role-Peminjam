import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/SharedPreferencesKeys.dart';

class DipinjamController extends GetxController
    with StateMixin<List<DataPinjam>> {
  //TODO: Implement DipinjamController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData(null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData(String? kategori) async {
    change(null, status: RxStatus.loading());
    try {
      if (kategori == null) {
        kategori = "DIPROSES";
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString(SharedPreferencesKeys.userId);
      String? token = prefs.getString(SharedPreferencesKeys.token);

      final response = await ApiProvider.instance().get(
        "${Endpoint.pinjam}"
        "/${userid}?status=${kategori}",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final ResponsePinjam responseBooks =
            ResponsePinjam.fromJson(response.data);
        change(responseBooks.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("${response.data['message']}"));
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null)
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }


  String Statusvalue = '';
  Future<void> updateData(int? id) async {
    try {
      Map<String, dynamic> userData = {
        'status': Statusvalue,
      };

      final response = await ApiProvider.instance().post(
        '${Endpoint.pinjam}/$id',
        data: dio.FormData.fromMap(userData),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'User data updated successfully',
            backgroundColor: Colors.green);
      } else {
        Get.snackbar('Error', 'Failed to update user data',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.red);
    }
  }




}
