import 'package:bukubuku_2/app/modules/user/views/Imagepicker/inputDecoration.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                DateTimePicker(
                  controller: controller.tglpinjamController,
                  dateMask: 'd MMM, yyyy',
                  decoration: AppDecorations.textFormFieldDecoration.copyWith(
                    hintText: "Tanggal Peminjaman",
                    prefixIcon: Icon(Icons.date_range_rounded)
                  ),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onChanged: (val) => print(val),
                  validator: (value) {
                    if (value!.length < 2) {
                      return 'Masukan Tanggal pengembalian';
                    }
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),

                SizedBox(height: 20,),
                DateTimePicker(
                  icon: Icon(Icons.date_range_rounded),
                  controller: controller.tglkembaliController,
                  dateMask: 'd MMM, yyyy',
                  decoration: AppDecorations.textFormFieldDecoration.copyWith(
                      hintText: "Tanggal Pengembalian",
                      prefixIcon: Icon(Icons.date_range_rounded)
                  ),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onChanged: (val) => print(val),
                  validator: (value) {
                    if (value!.length < 2) {
                      return 'Masukan Tanggal pengembalian';
                    }
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
                SizedBox(height: 20,),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    final bookData = Get.arguments;
                    controller.pinjam(bookData.id);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Warna latar belakang tombol
                    onPrimary: Colors.white, // Warna teks pada tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Mengatur sudut border tombol
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Padding dalam tombol
                  ),
                  child: Text(
                    'Tambah',
                    style: TextStyle(
                      fontSize: 16, // Ukuran teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
