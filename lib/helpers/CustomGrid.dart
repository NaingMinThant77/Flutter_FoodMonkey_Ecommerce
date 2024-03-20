// import 'package:flutter/material.dart';
// import 'package:foodmonkey/models/Product.dart';
// import 'package:foodmonkey/utils/Constants.dart';
// import 'package:foodmonkey/utils/Global.dart';

// class CustomGrid {
//   static Widget makeProductGrid(List<Product> products, Function changeState) {
//     return GridView.builder(
//         itemCount: products.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: ((context, index) => buildProductCard(products[index], changeState)));
//   }

//   static Widget buildProductCard(Product product, Function changeState) {
//     return Card(
//         child: Column(
//       children: [
//         Text(
//           product.name,
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Constants.normal),
//         ),
//         SizedBox(height: 5),
//         Image.asset(
//           "assets/images/${product.image}",
//           width: 120,
//           height: 120,
//         ),
//         // SizedBox(height: 10),
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //   children: [
//         //     InkWell(
//         //         onTap: () {
//         //           Global.addToCart(product);
//         //           changeState();
//         //         },
//         //         child: Icon(Icons.shopping_cart, color: Constants.accent)),
//         //     Text("3500 Ks"),
//         //     Icon(Icons.visibility, color: Constants.accent)
//         //   ],
//         // )
//       ],
//     ));
//   }
// }
