
import 'package:bukubuku_2/app/modules/user/views/Imagepicker/inputDecoration.dart';
import 'package:bukubuku_2/app/routes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/materials/responsivebottomnavigation.dart';
import '../controllers/user_controller.dart';
import 'Imagepicker/ImagePicker.dart';


class UserView extends GetView<UserController> {
    const UserView(  {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BgColor,
        title: Text(
          "User Profile",
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              controller.logout();
            },
          )
        ],
      ),
      body: SafeArea(child: Obx(
        () {

          var userData = controller.user.value;
          final UserController userController = Get.find();
          if (userData == null) {
            return const Center(child: CircularProgressIndicator());
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.namaController.text = userData.nama ?? '';
            controller.emailController.text = userData.email ?? '';
            controller.usernameController.text = userData.username ?? '';
            controller.telpController.text = userData.telp ?? '';
            controller.alamatController.text = userData.alamat ?? '';
          });
          XFile? selectedimage = controller.selectedImage.value;
          // userUpdate

          return Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [

                  Column(
                    children: [
                      Center(
                        child: ImgPckr(userData: controller.user.value, onImageSelected: (pickedFile) {
                          controller.selectedImage.value = pickedFile;
                      
                        },)
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('${userData.username}',style:
                      Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),overflow: TextOverflow.ellipsis,),
                      SizedBox(
                        height: 2,
                      ),
                      Text('${userData.email}'),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: controller.formkey,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: AppDecorations.textFormFieldDecoration.copyWith(
                          labelText: 'Nama',
                          hintText: 'Masukkan nama',
                          prefixIcon: const Icon(Icons.person),
                        ),
                        controller: controller.namaController,
                      ),


                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: AppDecorations.textFormFieldDecoration.copyWith(
                          labelText: 'Telp',
                          hintText: 'Masukan No Telepon',
                          prefixIcon: const Icon(Icons.phone),
                        ),
                        controller: controller.telpController,
                        // validator: (val) => val.isEmpty ? 'Invalid Name': null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: AppDecorations.textFormFieldDecoration.copyWith(
                          labelText: 'Alamat',
                          hintText: 'Masukkan Alamat',
                          prefixIcon: const Icon(Icons.maps_home_work),
                        ),
                        controller: controller.alamatController,
                        // validator: (val) => val.isEmpty ? 'Invalid Name': null,
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () =>  userController.updateData(selectedimage),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: BgColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            )
                          ]),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Update",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      )),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 2,
      ),
    );
  }
}



