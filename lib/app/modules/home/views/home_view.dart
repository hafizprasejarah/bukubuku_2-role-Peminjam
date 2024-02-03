import 'package:bukubuku_2/app/routes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              color: TextColor,
              onPressed: () {},
              icon: const Icon(Icons.search)),
          IconButton(
              color: TextColor,
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart)),
          const SizedBox(
            width: DefaultPadding / 2,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
            child: Text(
              "Women",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Categories(),
        ],
      ),
    );
  }
}

//statefull widget untuk categories
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Hand Bag', 'Jewellry', 'Footwear', 'Dresses'];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DefaultPadding),
      child: SizedBox(
        height: 27,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Buildcategory(index),
        ),
      ),
    );
  }

  Widget Buildcategory(int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
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
              margin: const EdgeInsets.only(top: 5),
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
