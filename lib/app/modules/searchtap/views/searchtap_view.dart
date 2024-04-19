import 'package:bukubuku_2/app/routes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/searchtap_controller.dart';

class SearchtapView extends GetView<SearchtapController> {
  const SearchtapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Column(
            children: [
              Searchview2(controller: controller.SearchController,onChanged: (value) {
                controller.UpdateList();
              }),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                        () {
                      if (controller.books!.isNotEmpty) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: controller.books!.length,
                            itemBuilder: (context, index) {
                              final book = controller.books![index];
                              return ListTile(
                                title: Text(book.judul??''),
                                leading: Icon(Icons.search),
                                onTap: () {
                                  Get.toNamed(Routes.BOOK_DETAIL, arguments: controller.books![index]);
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Center(
                            child: Text('No books found'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Searchview2 extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const Searchview2({super.key, required this.controller, required this.onChanged});

  @override
  State<Searchview2> createState() => _Searchview2State();
}

class _Searchview2State extends State<Searchview2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2), width: 1.0),
        color:BgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          isDense: true,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintStyle: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
