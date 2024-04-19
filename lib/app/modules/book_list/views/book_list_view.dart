import 'dart:ffi';

import 'package:bukubuku_2/app/data/model/response_kategori.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/Product_model.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_list_controller.dart';

class BookListView extends GetView<BookListController> {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
        title: Text(
          "Book List",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
            child: SearchView(controller: controller.SearchController,  onChanged: (value) {
              controller.UpdateList();
            },),
          ),
          Tap(selectedCategory: "tidak dikategorikan"),
          ]),
          Obx(
                () {
                  if (controller.books!= <DataBook>[] && controller.books!.isNotEmpty) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
                        child: GridView.builder(
                          itemCount: controller.books!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 9,
                            mainAxisSpacing: 9,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.toNamed(Routes.BOOK_DETAIL, arguments: controller.books![index]),
                            child: SearchGridCells(book: controller.books![index]),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "Tidak ada buku di kategori ${controller.kategori2}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }
                },
          ),
        ],
      ),
    );
  }
}
//statefull widget untuk categories
class Categories extends StatefulWidget {
  final Function(String) onCategorySelected;

  const Categories({super.key, required this.onCategorySelected});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final BookListController controller = Get.find<BookListController>();
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.kategori!.length,
            itemBuilder: (context, index) => Buildcategory(index),
          ),
        ),
      );
    });
  }

  Widget Buildcategory(int index) {
    final kategori = controller.kategori;
    final reversedKategori = kategori!.value.reversed.toList();
    final DataKategori category = reversedKategori[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
        widget.onCategorySelected(
          category.nama!,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category!.nama!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedindex == index ? TextColor : TextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2,
              width: 30,
              color: selectedindex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class SearchView extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const SearchView({super.key, required this.controller, required this.onChanged});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, // Atur tinggi sesuai kebutuhan
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2), width: 1.0),
        color: BgColor,
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

class SearchGridCells extends StatelessWidget {
  const SearchGridCells({super.key, this.book, this.product, this.press});

  final DataBook? book;
  final Product? product;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: BgColor, borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${Endpoint.Url}${book!.image}',
                width: size.width * 0.23,
                height: size.width * 0.23 * 1.6,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            "${book!.judul}",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class Tap extends StatefulWidget {
  final String selectedCategory;

  const Tap({Key? key, required this.selectedCategory});

  @override
  State<Tap> createState() => _TapState(selectedCategory: selectedCategory);
}

class _TapState extends State<Tap> {
  String selectedCategory;

  _TapState({required this.selectedCategory});

  final BookListController controller = Get.find<BookListController>();

  @override
  Widget build(BuildContext context) {
    return Categories(
      onCategorySelected: (category) {
        setState(() {
          selectedCategory = category;
          controller.getData(selectedCategory);
        });
      },
    );
  }
}
