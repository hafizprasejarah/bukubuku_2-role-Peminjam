import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_colors.dart';
import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.arguments.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Get.arguments.color == Colors.white ? TextColor : Colors.white,
          onPressed: () => Get.back(),
        ),
        actions: <Widget>[
          IconButton(
            color:
                Get.arguments.color == Colors.white ? TextColor : Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
              color: Get.arguments.color == Colors.white
                  ? TextColor
                  : Colors.white,
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
              )),
          const SizedBox(
            width: DefaultPadding / 2,
          )
        ],
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: DefaultPadding,
                      right: DefaultPadding),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color'),
                              Row(
                                children: [
                                  ColorDot(
                                    color: Color(0xFF356C95),
                                    isSelected: true,
                                  ),
                                  ColorDot(color: Color(0xFFF8C078)),
                                  ColorDot(color: Color(0xFF356C95)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(color: TextColor),
                                  children: [
                                TextSpan(text: 'Size\n'),
                                TextSpan(
                                    text: '${Get.arguments.size} cm',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(fontWeight: FontWeight.bold))
                              ])),
                        )
                      ],
                    ),
                    SizedBox(height: DefaultPadding/2),
                    Description(),
                    SizedBox(height: DefaultPadding/2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartCounter(),
                        AddFavorit(),
                      ],
                    ),
                    SizedBox(height: DefaultPadding/2),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: DefaultPadding),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: DefaultPadding),
                            height: 50,
                            width: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Get.arguments.color)),
                            child: IconButton(
                              icon: Icon(Icons.add_shopping_cart),
                              color: Get.arguments.color,
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Get.arguments.color),
                                  onPressed: () {},
                                  child: Text(
                                    'Buy Now'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                ProductTitleWithImage()
              ],
            ),
          )
        ],
      ),
    );
  }
}

// price and image product
class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Artistocratic Hand Bag',
            style: TextStyle(color: Colors.white),
          ),
          Text('${Get.arguments.title}',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'price\n'),
                TextSpan(
                    text: '\$${Get.arguments.price}',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              SizedBox(
                height: DefaultPadding * 10 + 20,
              ),
              Expanded(
                  child: Hero(
                    tag:'${Get.arguments.id}',
                    child: Image.asset(
                                    Get.arguments.image,
                                    height: 200,
                                    width: 500,
                                  ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorDot({super.key, required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: DefaultPadding / 4, right: DefaultPadding / 2),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DefaultPadding),
      child: Text(
        "${Get.arguments.description}",
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numoftimes = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildOutlineButton(
            press: () {
              setState(() {
                if (numoftimes > 1) {
                  numoftimes--;
                }
              });
            },
            icon: Icons.remove),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DefaultPadding / 2),
          child: Text(
            numoftimes.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        BuildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numoftimes++;
              });
            })
      ],
    );
  }

  SizedBox BuildOutlineButton(
      {required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
          onPressed: press,
          child: Icon(icon),
          style:
              ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero))),
    );
  }
}

class AddFavorit extends StatelessWidget {
  const AddFavorit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration:
          BoxDecoration(color: Color(0xFFFF6464), shape: BoxShape.circle),
      child: Icon(color: Colors.white, Icons.heart_broken),
    );
  }
}
