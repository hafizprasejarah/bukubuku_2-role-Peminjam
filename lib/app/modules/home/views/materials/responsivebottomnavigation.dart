import 'package:bukubuku_2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  MyBottomNavigationBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      onTap: (int index) {
        switch (index) {
          case 0:
           // Navigasi ke halaman home
            Get.toNamed(Routes.DENDA);
            break;
          case 1:
            Get.toNamed(Routes.HOME);// Navigasi ke halaman notifications
            break;
          case 2:
            Get.toNamed(Routes.USER);  // Navigasi ke halaman settings
            break;
          default:
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add),
          label: 'Denda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
        ),
      ],
    );
  }
}