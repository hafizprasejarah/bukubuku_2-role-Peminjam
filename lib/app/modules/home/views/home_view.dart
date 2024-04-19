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
           // Ambil data pengguna dari controller

          var now = new DateTime.now();
          var formatter = new DateFormat('yyyy-MM-dd');
          String formattedDate = formatter.format(now);

          var userData =
              controller.user.value;
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
                  SearchView(),
                  SizedBox(
                    height: 25,
                  ),
                  //menu button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jangan lupa bahagia",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.emoji_emotions_outlined,
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
            return Center(child: const CircularProgressIndicator()); // Tampilkan indikator loading jika data masih dimuat
          }
        }),
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}


class SearchView extends StatefulWidget {


  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SEARCHTAP);
      },
      child: Container(
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
    );
  }
}

// class Searchview2 extends StatefulWidget {
//   final TextEditingController controller;
//   const Searchview2({super.key, required this.controller});
//
//   @override
//   State<Searchview2> createState() => _Searchview2State();
// }
//
// class _Searchview2State extends State<Searchview2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 42, // Atur tinggi sesuai kebutuhan
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black.withOpacity(0.2), width: 1.0),
//         color: Colors.white38,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         controller: widget.controller,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           isDense: true,
//           hintText: "Search",
//           prefixIcon: Icon(
//             Icons.search_rounded,
//             color: Colors.white,
//           ),
//           border: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           hintStyle: TextStyle(fontSize: 15, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
