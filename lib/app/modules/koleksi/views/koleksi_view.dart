import 'package:bukubuku_2/app/data/model/response_koleksi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../routes/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  KoleksiView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BgColor,
        title: Text(
          "Koleksi",
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
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CheckBoxMulti(
            title: '',
            value: false,
            checkBoxList: controller.books!.map((books) {
              return CheckBoxMulti(
                book: books,
                title: books.book!.judul ?? '',
                value: false,
                checkBoxList: [],
              );
            }).toList(),
          );
        }
      }),
    );
  }
}


class CheckBoxMulti extends StatefulWidget {
  String title;
  bool value;
  final DataKoleksi? book;
  final List<CheckBoxMulti> checkBoxList;
  CheckBoxMulti({super.key, required this.title, this.value= false, required this.checkBoxList, this.book});

  @override
  State<CheckBoxMulti> createState() => _CheckBoxMultiState();
}

class _CheckBoxMultiState extends State<CheckBoxMulti> {
  // final CheckBoxList = [
  //   CheckBoxMulti(title: 'hafiz',),
  //   CheckBoxMulti(title: 'hafiz',),
  //   CheckBoxMulti(title: 'hafiz',)
  // ];
  final allChecked = CheckBoxMulti(title: 'Pilih Semua', checkBoxList: [],);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        ListTile(
          onTap: () =>onAllClicked(allChecked),
          leading: Checkbox(value: allChecked.value, onChanged: (value) => onAllClicked(allChecked),),
          title: Text(allChecked.title),
          trailing: IconButton(onPressed: () {
            setState(() {
              final KoleksiController koleksiController = Get.find();
              if (allChecked.value) {
                final KoleksiController koleksiController = Get.find();
                // Menghapus setiap item dari daftar checkbox
                if (widget.checkBoxList.isNotEmpty) {
                  widget.checkBoxList.forEach((item) {
                    if (item.value) {
                      koleksiController.deleteData(item.book!.id!.toInt());
                    }
                  });
                  // Setelah penghapusan selesai, hapus semua item dari daftar checkbox
                  widget.checkBoxList.clear();
                } else {
                  // Tampilkan pesan jika tidak ada item yang dipilih
                  Get.snackbar(
                    'Peringatan',
                    'Tidak ada item yang dipilih untuk dihapus.',
                    backgroundColor: Colors.red,
                  );
                }
              } else {
                Get.snackbar(
                  'Peringatan',
                  'Tidak ada item yang dipilih untuk dihapus.',
                  backgroundColor: Colors.red,
                );
              }


            });
          }, icon: Icon(Icons.delete,color: Colors.red,)),
        ),
        Divider(),
        ...widget.checkBoxList.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 0),
            child: ListTile(
              onTap: () =>onItemClicked(item),
              leading: Checkbox(value: item.value, onChanged: (value) => onItemClicked(item),),
              title: GestureDetector(
                onTap: () =>  Get.toNamed(Routes.BOOK_DETAIL, arguments: item.book!.book),
                child: Container(
                  child: Row(
                    children: [

                      Container(
                          height: 100,
                          width: 80,
                          child: Image.network('${Endpoint.Url}${item.book!.book!.image}',fit: BoxFit.fill,)),
                      SizedBox(width: 5,),
                      Text(item.title.length > 10 ? '${item.title.substring(0, 10)}...' : item.title,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              ),
              trailing: Column(
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      final KoleksiController koleksiController = Get.find();
                      // print('disini: ${item.value}');
                      if(item.value){
                        koleksiController.deleteData(item.book!.id!.toInt());
                        widget.checkBoxList.removeWhere((item) => item.value);

                      }else{
                        Get.snackbar(
                          'Peringatan',
                          'Tidak ada item yang dipilih untuk dihapus.',
                          backgroundColor: Colors.red,
                        );
                      }

                    });
                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                ],
              ),
            ),
          );
        }).toList()
      ],
    );
  }

  onAllClicked(CheckBoxMulti cbkItem){
    final newvalue = !cbkItem.value;
    setState(() {
      cbkItem.value = !cbkItem.value;
      widget.checkBoxList.forEach((element) {
        element.value = newvalue;
      });

    });
  }
  onItemClicked(CheckBoxMulti cbkItem){
    final newvalue = !cbkItem.value;
    setState(() {
      cbkItem.value = newvalue;
    });

    if(!newvalue){
      //This is  List  Checkbox  not checked full all => So not need to checked all
      allChecked.value= false;
    }else{
      //This is  List checkbox checked full => So need checked all
      final allchecked = widget.checkBoxList.every((element) => element.value);
      allChecked.value = allchecked;
    }
  }


}

