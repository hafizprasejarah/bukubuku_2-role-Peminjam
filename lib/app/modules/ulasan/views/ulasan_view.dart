import 'package:bukubuku_2/app/data/model/response_listUlasan.dart';
import 'package:bukubuku_2/app/data/model/response_ulasan.dart';
import 'package:bukubuku_2/app/modules/home/controllers/home_controller.dart';
import 'package:bukubuku_2/app/modules/user/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../book_detail/controllers/book_detail_controller.dart';
import '../controllers/ulasan_controller.dart';

class UlasanView extends GetView<UlasanController> {
  const UlasanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.ulasan.length;
      RxList<DataUlasanList>? ulasanList;
      final bookId = Get.find<BookDetailController>().getBookId();
      controller.bookID = bookId;
      return VIewUlasan(rating: 0,bookID: bookId, );
    });
  }
}


class VIewUlasan extends StatefulWidget {
  final double rating;
  final int bookID;
  const VIewUlasan({super.key, required this.rating, required this.bookID});
  @override
  State<VIewUlasan> createState() => _VIewUlasanState();
}

class _VIewUlasanState extends State<VIewUlasan> {
  final UlasanController controller = Get.find();
  final HomeController userlogin = Get.find();
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan & Rating'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ulasan:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.ulasan.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading:  CircleAvatar(
                        backgroundImage: controller.ulasan[index]!.user!.image != null
                            ? NetworkImage('${Endpoint.Url}${controller.ulasan[index]!.user!.image}') as ImageProvider<Object>
                            : AssetImage('assets/img/usernullimg.png') as ImageProvider<Object>,
                        radius: 20,  // Optionally set the radius of the CircleAvatar
                      ),
                      title: Text(controller.ulasan[index]!.user!.username ?? '',maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.ulasan[index]!.ulasan ?? ""),
                          Text("Rating: ${controller.ulasan[index]!.rating}", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      trailing: controller.ulasan[index]!.user!.username == userlogin.user.value!.username
                          ? PopupMenuButton(
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            value: 'delete',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'delete') {
                            controller.deleteData(controller.ulasan[index]!.id);
                          }
                        },
                      )
                          : SizedBox(),

                    ),
                  );
                },
              ),),
            ),
            SizedBox(height: 20),
// Rating bar
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20, // Ukuran bintang
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 10),
// Textfield untuk ulasan
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: controller.formkey,
                    child: TextField(
                      controller: controller.ulasanController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 16),
                        labelText: 'Tambahkan Ulasan',
                        border: OutlineInputBorder(),
                      ),
                      minLines: 1, // Atur jumlah baris minimal
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {

                    // Tambahkan ulasan baru
                    await controller.Ulasan(widget.bookID, _rating);

                    // Setelah menambah ulasan, perbarui data ulasan dengan memanggil getData()
                    await controller.getData();
                    _rating = 0;
                    controller.ulasanController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Warna latar belakang tombol
                    onPrimary: Colors.white, // Warna teks pada tombol
                  ),
                  child: const Text('Kirim Ulasan', style: TextStyle(fontSize: 13)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


