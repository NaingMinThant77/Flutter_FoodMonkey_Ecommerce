import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:foodmonkey/Pages/Detail2.dart';
import 'package:foodmonkey/helpers/ArcPainter.dart';
import 'package:foodmonkey/models/Product.dart';
import 'package:foodmonkey/utils/Constants.dart';

class Preview extends StatefulWidget {
  final Product? product;
  const Preview({super.key, required this.product});

  @override
  State<Preview> createState() => _PreviewState(this.product);
}

class _PreviewState extends State<Preview> {
  Product? product;
  _PreviewState(this.product);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Preview"),
          actions: [Constants.getCartAction(context,Constants.primary)],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(
                painter: ArcPainter(size),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(product?.name ?? "",
                        style: Constants.getTitleTextStyle(40.0)),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 150,
                      child: Swiper(
                        // viewportFraction: 0.5,
                        // scale: 0.9,
                        index: 0,
                        itemCount: product?.images?.length ?? 0,
                        autoplay: true,
                        scrollDirection: Axis.horizontal,
                        pagination:
                            SwiperPagination(alignment: Alignment.centerRight),
                        control: const SwiperControl(),
                        itemBuilder: (context, index) => Image.network(
                          Constants.getImageLink(product?.images?[index]),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Constants.buildRichText("Price", "3500 Ks", Constants.primary),
                    SizedBox(
                      height: 20,
                    ),
                    Constants.buildRichText("Size", "Large Size", Constants.primary),
                    SizedBox(
                      height: 20,
                    ),
                    Constants.buildRichText("Promo", "Coca Cola", Constants.primary),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    // Constants.cartProducts.add(product!);
                                    Constants.addToCart(product);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Constants.normal,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart,
                                        color: Constants.primary, size: 40),
                                    SizedBox(width: 10),
                                    Text("Buy Now",
                                        style: TextStyle(
                                            color: Constants.primary,
                                            fontSize: 20))
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: SizedBox(
                              width: 60,
                              height: 57,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Detail2(product: product)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Constants.normal,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        color: Constants.primary,
                                      ),
                                      SizedBox(width: 10),
                                      Text("Detail...",
                                          style: TextStyle(
                                              color: Constants.primary,
                                              fontSize: 25))
                                    ],
                                  ))),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  
}
