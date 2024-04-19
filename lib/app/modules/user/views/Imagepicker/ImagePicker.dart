import 'dart:io';

import 'package:bukubuku_2/app/data/constant/endpoint.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/model/response_user.dart';
import '../../controllers/user_controller.dart';
import '../user_view.dart';

class ImgPckr extends StatefulWidget {
  final DataUser? userData;
  final void Function(XFile?) onImageSelected;
  const ImgPckr({super.key, this.userData, required this.onImageSelected});

  @override
  State<ImgPckr> createState() => _ImgPckrState();


}

class _ImgPckrState extends State<ImgPckr> {
  XFile? _imageFile;
  final _picker = ImagePicker();

  Future<XFile?> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = XFile(pickedFile.path);

      });
      widget.onImageSelected(_imageFile);
    }

  }

  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child:  Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: _imageFile == null && widget.userData?.image == null
              ? Colors.grey // Warna default ketika kedua gambar null
              : Colors.grey, // Warna ambar jika salah satu gambar tersedia
          border: Border.all(color: Colors.black45),
          image: _imageFile == null
              ? widget.userData?.image != null
              ? DecorationImage(
            image: NetworkImage('${Endpoint.Url}${widget.userData!.image}'),
            fit: BoxFit.fill,
          )
              : null // Jika userData image null, maka tidak ada gambar latar belakang
              : DecorationImage(
            image: FileImage(File(_imageFile!.path)),
            fit: BoxFit.fill,
          ),
        ),

      ),
      onTap: () {
        getImage();
      },
    );
  }
}

