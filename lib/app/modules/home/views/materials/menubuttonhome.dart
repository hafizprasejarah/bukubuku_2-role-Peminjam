import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';



class MenuHome extends StatelessWidget {
  const MenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //menu button
        MenuHomeButton(icon: Icons.list, press: () => Get.toNamed(Routes.BOOK_LIST),text: "Daftar Buku"),
        MenuHomeButton(icon: Icons.add, press: () => Get.toNamed(Routes.KOLEKSI),text: "Koleksi"),
        MenuHomeButton(icon: Icons.book_rounded, press: () => Get.toNamed(Routes.DIPINJAM),text: "Dipinjam"),
        MenuHomeButton(icon: Icons.email, press: () => Get.toNamed(Routes.EMAILADMIN),text: "Hubungi Admin"),

        // profil


      ],
    );
  }

  MenuHomeButton({required IconData icon, required VoidCallback press, required String text}) {
    return Column(
      children: [
        Center(child: Column(
          children: [
            InkWell(
              onTap: press,
              // borderRadius: BorderRadius.circular(24), // Sesuaikan dengan bentuk yang diinginkan
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.all(9),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
