import 'package:bukubuku_2/app/routes/app_colors.dart';
import 'package:bukubuku_2/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'materials/menubuttonhome.dart';
import 'materials/responsivebottomnavigation.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BgColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),

      body: SafeArea(
        child: Obx(() {
          // current date(tanggal sekarang)
          var now = new DateTime.now();
          var formatter = new DateFormat('yyyy-MM-dd');
          String formattedDate = formatter.format(now);

          var userData =
              controller.user.value; // Ambil data pengguna dari controller
          if (userData != null) {
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Nama
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${userData.nama}!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            '${formattedDate}',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),

                      //History peminjaman
                      InkWell(
                        onTap: () => Get.toNamed(Routes.BOOK_LIST),
                        // borderRadius: BorderRadius.circular(24), // Sesuaikan dengan bentuk yang diinginkan
                        child: Icon(
                          Icons.history,
                          size: 28,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // SearchBar
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white38),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //menu button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "How do you feel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Menubutton
                  MenuHome(),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator(); // Tampilkan indikator loading jika data masih dimuat
          }
        }),
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}
