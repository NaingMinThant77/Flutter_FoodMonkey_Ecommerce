import 'package:flutter/material.dart';
import '../helpers/TrainglePainter.dart';
import '../utils/Api.dart';
import '../utils/Constants.dart';

class Flash extends StatefulWidget {
  const Flash({super.key});

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  void appVersionCheck() async {
    bool passedApiCheck = await Api.getApiVersion();
    bool passedTagCheck = await Api.getAllTags();
    bool passedCatCheck = await Api.getAllCats();

    if (passedApiCheck && passedTagCheck && passedCatCheck) {
      print("Good to Go!");
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      print("Api Version Problem");
    }
  }

  @override
  void initState() {
    super.initState();
    appVersionCheck();
  }

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        CustomPaint(painter: TrianglePainter(mSize)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Food Monkey",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Constants.normal),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
                child: Image.asset(
              "assets/images/FoodMonkey.png",
            )),
            SizedBox(
              height: 60,
            ),
            const Center(
              child: CircularProgressIndicator(
                backgroundColor: Constants.accent,
                valueColor: AlwaysStoppedAnimation(Constants.normal),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
