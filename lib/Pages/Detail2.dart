import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:foodmonkey/models/Product.dart';
import 'package:foodmonkey/utils/Constants.dart';

class Detail2 extends StatefulWidget {
  final Product? product;
  const Detail2({super.key, required this.product});

  @override
  State<Detail2> createState() => _Detail2State(this.product);
}

class _Detail2State extends State<Detail2> {
  Product? product;
  _Detail2State(this.product);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          actions: [Constants.getCartAction(context, Constants.primary)],
        ),
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Swiper(
                viewportFraction: 0.5,
                scale: 0.9,
                itemCount: product?.images?.length ?? 0,
                autoplay: true,
                itemBuilder: (context, index) =>
                    Image.network(
                        Constants.getImageLink(product?.images?[index]),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product?.name ?? "",
                          style: Constants.getTitleTextStyle(30)),
                      Constants.getCartAction(context, Constants.accent),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Constants.buildRichText("Price",
                          "${product?.price.toString()} Ks", Constants.normal),
                      Constants.buildRichText(
                          "Size", "${product?.size}", Constants.normal),
                      Constants.buildRichText(
                          "Promo", "Coca Cola", Constants.normal),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(Constants.sampleText,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Constants.normal)),
                  SizedBox(
                    height: 20,
                  ),
                  Table(
                    border:
                        TableBorder.all(style: BorderStyle.solid, width: 0.5),
                    children: [
                      _buildTableHeaderRow("Features", "Values"),
                      _buildTableRow("Price", "3500 Ks"),
                      _buildTableRow("Size", "Large Size"),
                      _buildTableRow("Promo", "Coca Cola"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(Constants.sampleText,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Constants.normal)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Delivery System",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.normal)),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network("http://192.168.100.24:3000/uploads/Daily_Delivery_1625048001786.png"),
                  Text("Warranty System",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.normal)),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset("assets/images/7_Day_Return_Warrranty.png")
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  TableRow _buildTableHeaderRow(t1, t2) {
    return TableRow(children: [
      Center(
          child: Text(t1,
              style: TextStyle(color: Constants.accent, fontSize: 20, height: 2))),
      Center(
          child: Text(t2,
              style: TextStyle(color: Constants.accent, fontSize: 20, height: 2)))
    ]);
  }

  TableRow _buildTableRow(t1, t2) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
            child: Text(t1,
                style: TextStyle(color: Constants.normal, fontSize: 16))),
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
            child: Text(t2,
                style: TextStyle(color: Constants.normal, fontSize: 16))),
      )
    ]);
  }
}
