import 'package:flutter/material.dart';
import 'package:foodmonkey/Pages/Preview.dart';
import 'package:foodmonkey/helpers/CustomGrid.dart';
import 'package:foodmonkey/models/Product.dart';
import 'package:foodmonkey/utils/Api.dart';
import 'package:foodmonkey/utils/Constants.dart';
import 'package:foodmonkey/utils/Global.dart';

import '../models/Tag.dart';

class Show extends StatefulWidget {
  const Show({super.key, this.loadName, this.type});
  final String? loadName, type;

  @override
  State<Show> createState() => _ShowState(loadName, type);
}

class _ShowState extends State<Show> {
  String? loadName, type;
  _ShowState(this.loadName, this.type);

  int pageNo = 0;
  List<Product> products = [];
  bool isLoading = false;

  loadProduct() async {
    setState(() {
      isLoading = true;
    });
    // await Future.delayed(Duration(seconds: 5));
    List<Product> pd = await Api.getPaginatedProducts(pageNo);
    setState(() {
      products.addAll(pd);
      pageNo++;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadProduct();
  }

  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text(loadName ?? ""),
          // ),
          body: Column(
        children: [
          _buildCustomNavBar(),
          Expanded(
              child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!isLoading &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      loadProduct();
                    }
                    return false;
                  },
                  child: _buildProductGrid())),
          Container(
              child:
                  Center(child: isLoading ? CircularProgressIndicator() : null))
        ],
      )),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
        height: 51,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: Constants.accent),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Constants.tags.length,
            itemBuilder: (context, index) =>
                _buildNavTitle(Constants.tags[index], index)));
  }

  GestureDetector _buildNavTitle(Tag tag, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(tag.name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white)),
            Container(
                height: 2,
                width: 30,
                color:
                    currentIndex == index ? Colors.yellow : Colors.transparent)
          ],
        ),
      ),
    );
  }

  GridView _buildProductGrid() {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => _buildProductCard(products[index]));
  }

  Column _buildProductCard(Product product) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Image.network(Constants.getImageLink(product.images?[0]), width: 150, height: 150,),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Preview(product: product)));
          },
          child: Text(product.name ?? "")),
        Text("${product.price}")
      ],
    );
  }
}
