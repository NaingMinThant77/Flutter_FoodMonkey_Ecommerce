import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmonkey/Pages/Register.dart';
import 'package:foodmonkey/helpers/TrainglePainter.dart';
import 'package:foodmonkey/utils/Api.dart';
import 'package:foodmonkey/utils/Constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var _phoneController = TextEditingController(text: "09300300300");
  var _phoneError = "";
  var _passwordController = TextEditingController(text: "@123!Abc");
  var _passwordError = "";

  var _errorsMsg = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        CustomPaint(painter: TrianglePainter(size)),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 120,
                      child: Image.asset("assets/images/FoodMonkey.png")),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Login",
                      style: TextStyle(fontSize: 30, color: Constants.normal)),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              if (value.length < 7 || value.length > 11) {
                                setState(() {
                                  _phoneError =
                                      "Phone must be between 7 and 11 numbers";
                                });
                              } else {
                                setState(() {
                                  _phoneError = "";
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                _errorsMsg.add("Phone can't be empty");
                                return "Phone can't be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: "Phone",
                                errorText: _phoneError,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constants.normal)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.normal),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            onChanged: (value) {
                              if (value.length < 8) {
                                setState(() {
                                  _passwordError =
                                      "Password must be at least 8 character";
                                });
                              } else {
                                setState(() {
                                  _passwordError = "";
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                _errorsMsg.add("Password can't be empty");
                                return "Password can't be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: Icon(Icons.remove_red_eye),
                                errorText: _passwordError,
                                labelText: "Password",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constants.normal)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Constants.normal))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                                },
                                child: Text(
                                  "Not a member yet! \n Register here",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueAccent),
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Constants.accent,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10)),
                                  onPressed: () async {
                                    var phone = _phoneController.text;
                                    var password = _passwordController.text;

                                    bool bol = await Api.loginUser(
                                      phone: phone, password: password
                                    );

                                    if (bol) {
                                Constants.getSocket();
                                Navigator.pop(context);
                              } else {
                                print("Login Fail!");
                              }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.lock),
                                      Text("Login", style: TextStyle(color: Constants.primary, fontSize: 20),)
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
