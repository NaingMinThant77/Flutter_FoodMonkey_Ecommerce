import 'package:foodmonkey/Pages/Cart.dart';
import 'package:foodmonkey/models/Category.dart';
import 'package:foodmonkey/models/Product.dart';
import 'package:foodmonkey/models/Tag.dart';

import 'package:flutter/material.dart';
import 'package:foodmonkey/models/User.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Constants {
  static const Color yellow = Color(0xffFDC054);
  static const Color darkGrey = Color(0xff202020);
  static const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);

  static const Color primary = Color(0xFFF6F6F6);
  static const Color secondary = Color(0xFFFFBB91);
  static const Color accent = Color(0xFFFF8E6E);
  static const Color normal = Color(0xFF515070);

  static const double API_VERSION = 1.0;

  static const String BASE_URL =
      "http://192.168.100.24:3000"; // ifconfig - wlp59s0
  static const String API_URL = "$BASE_URL/api";

  static List<Tag> tags = [];
  static List<Category> cats = [];

  static String getImageLink(image) {
    var img = BASE_URL + "/uploads" + image.split("uploads")[1];
    return img;
  }

  static TextStyle getTitleTextStyle(double size) {
    return TextStyle(
        fontSize: size, fontWeight: FontWeight.bold, color: Constants.normal);
  }

  static Widget buildRichText(t1, t2, Color color) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$t1\n",
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'English',
              color: color,
              fontWeight: FontWeight.bold)),
      TextSpan(
          text: "\t\t\t\t\t\t    $t2",
          style: TextStyle(
              fontSize: 15, fontFamily: 'English', color: Constants.normal))
    ]));
  }

  static Padding getCartAction(context, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Icon(
              Icons.shopping_cart,
              size: 40,
              color: color,
            ),
          ),
          Positioned(
            right: 0,
            top: -5,
            child: Container(
              width: 20,
              height: 20,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Center(
                  child: Text(Constants.cartProducts.length.toString(),
                      style: TextStyle(color: Constants.primary))),
            ),
          )
        ],
      ),
    );
  }

  static const sampleText =
      " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  static List<Product> cartProducts = [];

  static addToCart(product) {
    bool exist = false;

    if (cartProducts.length > 0) {
      cartProducts.forEach((prod) {
        if (prod.id == product.id) {
          prod.count++;
          exist = true;
        }
      });
      if (!exist) {
        cartProducts.add(product);
      }
    } else {
      cartProducts.add(product);
    }
  }

  static removeProduct(product) {
    cartProducts.removeWhere((prd) => prd.id == product.id);
  }

  static addProductCount(product) {
    cartProducts.forEach((prd) {
      if (prd.id == product.id) {
        prd.count++;
      }
    });
  }

  static reduceProductCount(product) {
    cartProducts.forEach((prd) {
      if (prd.id == product.id) {
        if (prd.count > 1) {
          prd.count--;
        }
      }
    });
  }

  static int getCartTotal() {
    int total = 0;
    cartProducts.forEach((p) {
      total += p.count * int.parse(p.price.toString());
    });
    return total;
  }

  static User? user;

  static Map<String, String> headers = {"Content-Type": "application/json"};

  static Map<String, String> tokenHeader = {
    'Content-type': 'application/json',
    'authorization': 'Bearea ${user?.token}'
  };

  static generateOrder() {
    List<Map> cartList = [];
    cartProducts.forEach((prod) {
      var map = new Map();
      map["count"] = prod.count.toString();
      map["productId"] = prod.id;
      cartList.add(map);
    });
    return cartList;
  }

  //Not real
  static List<List<String>> orders = [
    ["Order One", "Order One", "Order One"],
    ["Order Two", "Order Two", "Order Two", "Order Two", "Order Two"],
    ["Order Three", "Order Three"]
  ];

  static const String sampleImage =
      "http://192.168.100.24:3000/uploads/8_1616675537280.png";

  static String SOCKET_END_POINT = "$BASE_URL/chat?token=${user?.token}";

  // For testing, if application is owner, firecamp is tester
  static IO.Socket? socket;

  static getSocket() {
    socket = IO.io(SOCKET_END_POINT, <String, dynamic>{
      'transports': ['websocket']
    });
    socket?.onConnect((_) {
      print("Connected");
    });
  }
                                            //to (server )
    static const String shopId = "605c19163bac7310fb16aabc"; 

      static const String GALLERY_URL = "$BASE_URL/gallery";
}
