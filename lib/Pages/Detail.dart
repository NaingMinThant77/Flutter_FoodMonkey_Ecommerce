// import 'package:flutter/material.dart';
// import 'package:foodmonkey/utils/Constants.dart';

// class Detail extends StatefulWidget {
//   const Detail({super.key});

//   @override
//   State<Detail> createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(title: Text("Product Detail")),
//       body: Stack(
//         children: [
//           Container(
//             height: (size.height / 3) * 2,
//             margin: EdgeInsets.only(top: (size.height / 3)),
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//                 color: secondary,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(50),
//                     topRight: Radius.circular(50))),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildRichText("Price", "3500 Ks"),
//                     _buildRichText("Size", "Large Size"),
//                     _buildRichText("Promo", "Coca Cola"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   sampleText,
//                   textAlign: TextAlign.justify,
//                   style: TextStyle(color: primary, fontSize: 16),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                             width: 50,
//                             height: 35,
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: normal,
//                                   padding: EdgeInsets.zero),
//                               child: Icon(
//                                 Icons.add,
//                                 color: primary,
//                               ),
//                             )),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "3".padLeft(2, "0"),
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                         SizedBox(
//                             width: 50,
//                             height: 35,
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: normal,
//                                   padding: EdgeInsets.zero),
//                               child: Icon(
//                                 Icons.remove,
//                                 color: primary,
//                               ),
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                       child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.favorite_border,
//                             size: 40,
//                             color: normal,
//                           )),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 30),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: 70,
//                       height: 50,
//                       child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: normal,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                           child: Icon(
//                             Icons.shopping_cart,
//                             color: primary,
//                           )),
//                     ),
//                     SizedBox(width: 30),
//                     Expanded(
//                       child: SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: normal,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                             child: Icon(
//                               Icons.shopping_cart,
//                               color: primary,
//                             )),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 Text("Big Burger",
//                     style: TextStyle(
//                         fontSize: 40,
//                         color: normal,
//                         fontWeight: FontWeight.bold)),
//                 SizedBox(height: 20),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                         text: TextSpan(children: [
//                       TextSpan(
//                           text: "We Serve\n",
//                           style: TextStyle(
//                               color: normal,
//                               fontSize: 25,
//                               fontFamily: 'English',
//                               fontWeight: FontWeight.bold)),
//                       TextSpan(
//                           text: "\t\t\t   the Best",
//                           style: TextStyle(
//                               color: normal,
//                               fontSize: 20,
//                               fontFamily: 'English'))
//                     ])),
//                     Image.asset(
//                       "assets/images/9.png",
//                       width: 260,
//                       height: 260,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildRichText(t1, t2) {
//     return RichText(
//         text: TextSpan(children: [
//       TextSpan(
//           text: "$t1\n", style: TextStyle(fontSize: 30, fontFamily: "English")),
//       TextSpan(
//           text: "\t\t\t\t$t2",
//           style: TextStyle(fontSize: 20, fontFamily: "English", color: normal)),
//     ]));
//   }
// }
