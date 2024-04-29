  import 'package:bukubuku_2/app/modules/user/views/Imagepicker/inputDecoration.dart';
  import 'package:date_time_picker/date_time_picker.dart';
  import 'package:flutter/material.dart';

  import 'package:get/get.dart';
  import 'package:intl/intl.dart';
  import '../controllers/peminjaman_controller.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

  class PeminjamanView extends GetView<PeminjamanController> {
    const PeminjamanView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      DateTime now = DateTime.now();
      DateTime twoWeeksLater = now.add(Duration(days: 14));

      String formattedNow = DateFormat('yyyy-MM-dd HH:mm').format(now);
      String formattedTwoWeeksLater =
      DateFormat('yyyy-MM-dd HH:mm').format(twoWeeksLater);

      return Scaffold(
        appBar: AppBar(
          title: const Text('PeminjamanView'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.formkey,
              child: Column(
                children: [
                  Text(
                    'Tanggal Peminjaman:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedNow,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tanggal Pengembalian:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedTwoWeeksLater,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),

                  Obx(
                        () => controller.loading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () {
                        final bookData = Get.arguments;
                        controller.pinjam(bookData.id,formattedNow,formattedTwoWeeksLater);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Warna latar belakang tombol
                        onPrimary: Colors.white, // Warna teks pada tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Mengatur sudut border tombol
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8), // Padding dalam tombol
                      ),
                      child: Text(
                        'Tambah',
                        style: TextStyle(
                          fontSize: 16, // Ukuran teks
                          fontWeight: FontWeight.bold, // Ketebalan teks
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
