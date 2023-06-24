import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../commonWidget/slide_page_route.dart';
import '../home/homeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String title = 'hihi';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: _screenSize.width,
                height: _screenSize.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFAC5FCF),
                      Color(0xFF4B2FB7)
                    ], // Replace with your desired colors
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: _screenSize.height * .15),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          //fontFamily: AppTheme.fontName,
                          fontSize: 30,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          //letterSpacing: 0.21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenSize.height * .01,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Log in to continue accessing the app's features and services.",
                        style: TextStyle(
                          //fontFamily: AppTheme.fontName,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          //letterSpacing: 0.27,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(children: [
                        SizedBox(
                          height: _screenSize.height * .1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(12),
                          width: _screenSize.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  // color: Colors.red,
                                  width: _screenSize.width * 0.1,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/img/email.svg',
                                      width: _screenSize.width * .7,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: _screenSize.width * 0.6,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    //maxLength: 10,
                                    textAlign: TextAlign.start,
                                    //controller: controller.mobileController,
                                    style: const TextStyle(fontSize: 16),
                                    textInputAction: TextInputAction.done,
                                    onChanged: (value) {
                                      phoneNumber = value;

                                      // if (value.length == 10) {
                                      //   FocusScope.of(context).unfocus();
                                      // }
                                    },
                                    decoration: InputDecoration(
                                      counterText: "",
                                      counterStyle: const TextStyle(
                                          height: double.minPositive),
                                      border: InputBorder.none,
                                      hintText: "Enter email",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500,
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _screenSize.height * .02,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(12),
                          width: _screenSize.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  // color: Colors.red,
                                  width: _screenSize.width * 0.1,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/img/password.svg',
                                      width: _screenSize.width * .7,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: _screenSize.width * 0.6,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    //maxLength: 10,
                                    textAlign: TextAlign.start,
                                    obscureText: true,
                                    //controller: controller.mobileController,
                                    style: const TextStyle(fontSize: 16),
                                    textInputAction: TextInputAction.done,
                                    onChanged: (value) {
                                      phoneNumber = value;

                                      // if (value.length == 10) {
                                      //   FocusScope.of(context).unfocus();
                                      // }
                                    },
                                    decoration: InputDecoration(
                                      counterText: "",
                                      counterStyle: const TextStyle(
                                          height: double.minPositive),
                                      border: InputBorder.none,
                                      hintText: "Enter password",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500,
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.green),
                                    onChanged: (value) {
                                      print('checked---$value');
                                      // controller.checkBoxPrivacy.value = value!;
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print('1');
                                    },
                                    child: const Text(
                                      "Remember me ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  print('2');
                                },
                                child: const Text(
                                  "Forget Password",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _screenSize.height * .1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              SlidePageRoute(
                                page: HomeScreen(),
                                tween: Tween(
                                  begin: const Offset(1, 0),
                                  end: Offset.zero,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            width: _screenSize.width,
                            height: _screenSize.height * .06,
                            decoration: BoxDecoration(
                              color: Color(0xFF001233),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color(0xFF001233),
                                width: 1.5,
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   width: _screenSize.width,
          //   height: _screenSize.height,
          //   color: Colors.grey.withOpacity(0.3),
          //   child: const Center(
          //     child: CircularProgressIndicator(
          //       color: Color(0xFFFBC338),
          //       strokeWidth: 5,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
