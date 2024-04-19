import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../routes/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dipinjam_controller.dart';

class DipinjamView extends GetView<DipinjamController> {
  final String selectedcategory1 = "diproses";
  const DipinjamView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String? selectedCategory;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BgColor,
        title: Text(
          "Dipinjam",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks putih
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
      ),
      body: Column(
        children: [
         Tap(selectedCategory: selectedcategory1),
          Expanded(
            child: controller.obx(
                  (state) {
                return state != null && state.isNotEmpty
                    ? ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    DataPinjam dataPinjam = state[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Card(
                        color: BgColor,
                        elevation: 2.0,
                        child: ListTile(
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                child: Image.network('${Endpoint.Url}${dataPinjam.book!.image}'),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ID peminjaman: ${dataPinjam.id}",
                                      style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold,),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "judul: ${dataPinjam.book?.judul}",
                                      style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold,),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Pinjam: ${dataPinjam.tanggalPinjam}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Kembali: ${dataPinjam.tanggalKembali}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "Status : ${dataPinjam.status}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: dataPinjam.status == "Dipinjam"
                                            ? Colors.red
                                            : Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.chevron_right,color: Colors.white,),
                        ),
                      ),
                    );
                  },
                )
                    : Center(
                  child: Text(
                    "Tidak ada",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}


class Categories extends StatefulWidget {
  final Function(String) onCategorySelected;
  const Categories({super.key, required this.onCategorySelected});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Diproses', 'Dipinjam','Dikembalikan'];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Buildcategory(index),
        ),
      ),
    );
  }

  Widget Buildcategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
        widget.onCategorySelected(categories[index]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
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


class Tap extends StatefulWidget {
  final String selectedCategory;
  const Tap({Key? key, required this.selectedCategory});

  @override
  State<Tap> createState() => _TapState(selectedCategory: selectedCategory);
}

class _TapState extends State<Tap> {
  String selectedCategory;

  _TapState({required this.selectedCategory});
  final DipinjamController controller = Get.find<DipinjamController>();

  @override
  Widget build(BuildContext context) {
    return Categories(
      onCategorySelected: (category) {
        setState(() {
          selectedCategory = category;
          controller.getData(selectedCategory);
          print(selectedCategory);
        });
      },
    );
  }
}
