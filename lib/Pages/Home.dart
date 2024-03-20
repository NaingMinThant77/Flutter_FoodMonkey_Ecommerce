import 'package:flutter/material.dart';
import 'package:foodmonkey/Pages/Show.dart';
import 'package:foodmonkey/models/Category.dart';
import 'package:foodmonkey/utils/Constants.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            InkWell(
                onTap: () {
                  if (Constants.user == null) {
                    Navigator.pushNamed(context, "/login");
                  } else {
                    Navigator.pushNamed(context, "/chat");
                  }
                },
                child: Icon(Icons.chat)),
            InkWell(
                onTap: () => Navigator.pushNamed(context, "/record"),
                child: Icon(Icons.history))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitleTaxBar("Tags"),
            Container(
              height: 150,
              child: Swiper(
                // viewportFraction: 0.5,
                // scale: 0.9,
                index: 0,
                itemCount: Constants.tags.length,
                autoplay: true,
                scrollDirection: Axis.horizontal,
                pagination: SwiperPagination(alignment: Alignment.centerRight),
                control: const SwiperControl(),
                itemBuilder: (context, index) =>
                    // Text(Constants.tags[index].name ?? ""),
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Show(
                                  loadName: Constants.tags[index].name,
                                  type: "Tag",
                                )));
                  },
                  child: Image.network(
                    // Constants.tags[index].image ?? "",
                    Constants.getImageLink(Constants.tags[index].image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTitleTaxBar("Categories"),
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 1, right: 1),
                    itemCount: Constants.cats.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) =>
                        // Text(Constants.cats[index].name ?? ""),
                        _buildCategoryCard(Constants.cats[index])))
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Category cat) {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Show(
                        loadName: cat.name,
                        type: "Category",
                      )));
        });
      },
      child: Card(
          child: Column(
        children: [
          Text(
            cat.name ?? "",
            style: TextStyle(color: Constants.normal, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 90,
            child: Image.network(
              // cat.image ?? "",
              // "http://localhost:3000/${cat.image}",
              Constants.getImageLink(cat.image),
              fit: BoxFit.fill,
            ),
          )
        ],
      )),
    );
  }

  Widget _buildTitleTaxBar(text) {
    return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Constants.secondary,
            borderRadius: BorderRadius.only(topRight: Radius.circular(80))),
        child: Text(text,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Constants.normal)));
  }
}
