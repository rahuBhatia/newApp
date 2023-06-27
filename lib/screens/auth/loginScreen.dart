import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../commonWidget/slide_page_route.dart';
import '../../constant/constant_data.dart';
import '../../model/authModel.dart';
import '../home/homeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String title = 'hihi';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = '';
  late AuthModel _authModel;
  String userName = '';
  String password = '';

  checkisLogin() async {
    print('hi i am in');
    var token =
        await SharedPreferencesData().getData(SharedPreferencesData().tokenKey);
    print('=====----===$token');
    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          SlidePageRoute(
            page: HomeScreen(),
            tween: Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ),
          ),
          (route) => false);
    }
  }

  void initState() {
    super.initState();
    _authModel = Provider.of<AuthModel>(context, listen: false);
    checkisLogin();
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Consumer<AuthModel>(builder: (ctx, userModelData, _) {
      return Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: _screenSize.width,
                  height: _screenSize.height,
                  decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [
                      //     Color(0xFF856AEF),
                      //     Color(0xFF4B2FB7)
                      //   ], // Replace with your desired colors
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      // ),
                      color: Colors.white),
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
                            color: Colors.black,
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
                            color: Colors.black,
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
                                color: Color(0xFF856AEF),
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
                                        userName = value;
                                      },
                                      decoration: InputDecoration(
                                        counterText: "",
                                        counterStyle: const TextStyle(
                                            height: double.minPositive),
                                        border: InputBorder.none,
                                        hintText: "User Name",
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
                                color: Color(0xFF856AEF),
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
                                        password = value;
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
                                          color: Colors.black,
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
                                      color: Colors.black,
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
                            onTap: () async {
                              bool result =
                                  await userModelData.verificationUser(
                                      userName: userName, userPass: password);
                              if (result) {
                                // Navigator.of(context).push(
                                //   SlidePageRoute(
                                //     page: HomeScreen(),
                                //     tween: Tween(
                                //       begin: const Offset(1, 0),
                                //       end: Offset.zero,
                                //     ),
                                //   ),
                                // );
                                Navigator.of(context).pushAndRemoveUntil(
                                    SlidePageRoute(
                                      page: HomeScreen(),
                                      tween: Tween(
                                        begin: const Offset(1, 0),
                                        end: Offset.zero,
                                      ),
                                    ),
                                    (route) => false);
                              } else {
                                // message : 'Something wents wrong! ',
                                //                   bgColor: Colors.red,
                                //                   textColor: Colors.white
                                print('ji i am errpr');
                                toastPopUp(
                                  bgColor: Colors.red,
                                  message: 'Something wents wrong!',
                                  textColor: Colors.white,
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(12),
                              width: _screenSize.width,
                              height: _screenSize.height * .06,
                              decoration: BoxDecoration(
                                color: Color(0xFF856AEF),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Color(0xFF856AEF),
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
    });
  }
}
