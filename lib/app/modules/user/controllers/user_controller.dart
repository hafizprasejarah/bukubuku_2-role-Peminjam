import 'package:bukubuku_2/app/data/model/response_user.dart';
import 'package:bukubuku_2/app/routes/SharedPreferencesKeys.dart';
import 'package:bukubuku_2/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';


class UserController extends GetxController {
  Rx<DataUser?> user = Rx<DataUser?>(null);
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final Rx<XFile?> selectedImage = Rx<XFile?>(null);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
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


  Future<void> updateData(XFile? imageFile) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(SharedPreferencesKeys.token);
      String? userid = prefs.getString(SharedPreferencesKeys.userId);

      bool hasExpired = JwtDecoder.isExpired(token!);
      print(hasExpired);
      if(hasExpired){
        print(hasExpired);
        Get.offAllNamed(Routes.LOGIN);
      }
      Map<String, dynamic> userData = {
        'nama': namaController.text,
        'telp': telpController.text,
        'alamat': alamatController.text,
        if(imageFile != null)'image': await dio.MultipartFile.fromFile(imageFile.path, filename: 'image.png'),
      };

      final response = await ApiProvider.instance().post(
        '${Endpoint.user}/$userid',
        data: dio.FormData.fromMap(userData),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
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


  String TOKEN_KEY = 'token';
  String USER_ID_KEY = 'userId';
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(TOKEN_KEY);
    await prefs.remove(TOKEN_KEY);
    await prefs.remove(USER_ID_KEY);
    Get.offAllNamed(Routes.LOGIN);
    // try {
    //   // Hapus token dari penyimpanan lokal
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? token = prefs.getString(TOKEN_KEY);
    //
    //   // Lakukan permintaan logout ke server
    //   final response = await ApiProvider.instance().post(
    //     Endpoint.logout,
    //     data: dio.FormData(), // Gunakan FormData kosong jika tidak ada data tambahan yang perlu dikirim
    //     options: Options(
    //       headers: {
    //         'Authorization': 'Bearer $token',
    //       },
    //     ),
    //   );
    //
    //   // Periksa status kode respons
    //   if (response.statusCode == 200) {
    //     // Hapus token dan userId dari penyimpanan lokal
    //     await prefs.remove(TOKEN_KEY);
    //     await prefs.remove(USER_ID_KEY);
    //     print('Token and userId removed from SharedPreferences');
    //
    //     // Redirect ke halaman login
    //     Get.offAllNamed(Routes.LOGIN);
    //   } else {
    //     // Tangani jika permintaan logout tidak berhasil
    //     print('Logout failed: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   // Tangani kesalahan jika terjadi
    //   print('Error during logout: $e');
    // }
  }

}
