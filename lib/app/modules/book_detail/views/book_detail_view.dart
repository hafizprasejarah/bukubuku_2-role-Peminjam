import 'package:bukubuku_2/app/modules/ulasan/controllers/ulasan_controller.dart';
import 'package:bukubuku_2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_listUlasan.dart';
import '../../../routes/app_colors.dart';
import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookId = Get.arguments.id;
    controller.setBookId(bookId);
    return Scaffold(
      backgroundColor: BgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Get.back(),
        ),

      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailController controller = Get.find();
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Rating'),
                                  Row(
                                    children: [
                                      RatingStar(rating: controller.average,maxRating: 5, filledStar: Icons.star,
                                        unfilledStar: Icons.star_border,
                                        color: Colors.amber,)
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
                                    TextSpan(text: 'Kategori\n'),
                                    TextSpan(
                                        text: '${Get.arguments.kategori.nama}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))
                                  ])),
                            )
                          ],
                        ),
                        SizedBox(height: DefaultPadding / 2),
                        Expanded(
                            child: SingleChildScrollView(child: Description())),
                        SizedBox(height: DefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AddFavorit(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: DefaultPadding),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: DefaultPadding),
                                height: 50,
                                width: 58,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: BgColor)
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.comment_rounded),
                                  onPressed: () {
                                    Get.toNamed(Routes.ULASAN,arguments: Get.arguments.id);
                                  },
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blue),
                                      onPressed: () {
                                        Get.toNamed(Routes.PEMINJAMAN, arguments: Get.arguments);
                                      },
                                      child: Text(
                                        'Pinjam'.toUpperCase(),
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
            'Karya dari ${Get.arguments.penulis}',
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${Get.arguments.judul}',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(DefaultPadding / 9),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  '${Endpoint.Url}${Get.arguments.image}',
                  height: 200,
                  width: 135,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                      text: TextSpan(children: [
                        TextSpan(text: 'Penulis :\n'),
                        TextSpan(
                          text: '${Get.arguments.penulis}',
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ])),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(text: 'Penerbit :\n'),
                          TextSpan(
                              text: '${Get.arguments.penerbit}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Tahun Terbit :\n',
                              style: TextStyle(color: TextColor)),
                          TextSpan(
                              text: '${Get.arguments.tahunTerbit}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                        ])),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RatingStar extends StatelessWidget {
  final RxInt rating;
  final int maxRating;
  final IconData filledStar;
  final IconData unfilledStar;
  final Color color;
  const RatingStar({
    Key? key,
    required this.rating,
    required this.maxRating,
    required this.filledStar,
    required this.unfilledStar,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: List.generate(
        maxRating,
            (index) {
          if (index < rating.value) {
            return Icon(
              filledStar,
              color: color,
            );
          } else {
            return Icon(
              unfilledStar,
              color: color,
            );
          }
        },
      ),
    ));
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
        style: TextStyle(height: 1.5),textAlign: TextAlign.justify,
      ),
    );
  }
}


class AddFavorit extends StatelessWidget {
   AddFavorit({super.key});

  final bookData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      width: 39,
      decoration:
          BoxDecoration(color: Color(0xFFFF6464), shape: BoxShape.circle),
      child: IconButton(onPressed: (){
        final controller = Get.find<BookDetailController>();
        controller.addKoleksi(bookData.id.toString());
      } , icon: Icon(color: Colors.white, Icons.favorite,size: 21,)),
    );
  }
}
