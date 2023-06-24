import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({super.key});

  @override
  State<StatefulWidget> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool tasksOpen = true;
  taskList(_screenSize, title) {
    return Container(
      height: _screenSize.height * .07,
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            width: _screenSize.width * 0.08,
            child: Center(
              child: SvgPicture.asset(
                'assets/img/Chart.svg',
                width: _screenSize.width * .7,
              ),
            ),
          ),
          SizedBox(
            width: _screenSize.width * .03,
          ),
          Text(
            title,
            style: const TextStyle(
              //fontFamily: AppTheme.fontName,
              fontSize: 25,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w200,
              //letterSpacing: 0.21,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Drawer(
      //drawer: const DrawerHome(),
      child: SingleChildScrollView(
        child: Container(
          width: _screenSize.width,
          height: _screenSize.height,
          color: Color(0xFFFF),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: _screenSize.height * .1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: _screenSize.height * .1),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF4B2FB7),
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "U",
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
                    ),
                    SizedBox(
                      width: _screenSize.width * .03,
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: _screenSize.height * .15),
                      //alignment: Alignment.topLeft,
                      child: const Text(
                        "Username",
                        style: TextStyle(
                          //fontFamily: AppTheme.fontName,
                          fontSize: 25,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          //letterSpacing: 0.21,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35),
                width: _screenSize.width,
                height: _screenSize.height * .1,
                margin: EdgeInsets.only(top: _screenSize.height * .01),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(.4),
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(.4),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      width: _screenSize.width * 0.08,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/img/Home.svg',
                          width: _screenSize.width * .7,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _screenSize.width * .03,
                    ),
                    const Text(
                      "Home",
                      style: TextStyle(
                        //fontFamily: AppTheme.fontName,
                        fontSize: 25,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w200,
                        //letterSpacing: 0.21,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35, right: 20, top: 20),
                width: _screenSize.width,
                //height: _screenSize.height * .1,
                // margin: EdgeInsets.only(top: _screenSize.height * .01),
                // decoration: BoxDecoration(
                //   border: Border(
                //     bottom: BorderSide(
                //       color: Colors.grey.withOpacity(.4),
                //       width: 1,
                //     ),
                //   ),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tasks",
                      style: TextStyle(
                        //fontFamily: AppTheme.fontName,
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        //letterSpacing: 0.21,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print('Hi I AM IN');
                        tasksOpen = !tasksOpen;
                        print(tasksOpen);
                        setState(() {
                        });
                      },
                      child: Container(
                        //color: Colors.red,
                        width: _screenSize.width * 0.06,
                        height: _screenSize.height * 0.03,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/img/arrowDown.svg',
                            width: _screenSize.width * .7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (tasksOpen) ? Container(
                //color: Colors.red,
                width: _screenSize.width,
                padding: EdgeInsets.only(left: 35),
                child: Column(
                  children: [
                    taskList(_screenSize, 'Job Task 1'),
                    taskList(_screenSize, 'Job Task 2'),
                    taskList(_screenSize, 'Job Task 3'),
                    taskList(_screenSize, 'Job Task 4'),
                  ],
                ),
              ) : SizedBox.shrink(),
              Container(
                padding: EdgeInsets.only(left: 35),
                width: _screenSize.width,
                height: _screenSize.height * .1,
                margin: EdgeInsets.only(top: _screenSize.height * .01),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(.4),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      width: _screenSize.width * 0.08,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/img/Setting.svg',
                          width: _screenSize.width * .7,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _screenSize.width * .03,
                    ),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        //fontFamily: AppTheme.fontName,
                        fontSize: 25,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w200,
                        //letterSpacing: 0.21,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 35 , bottom: 35),
                  width: _screenSize.width,
                  //height: _screenSize.height * .02,
                  //margin: EdgeInsets.only(top: _screenSize.height * .01),
                  //color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        //color: Colors.green,
                        width: _screenSize.width * 0.08,
                        height: _screenSize.height * .04,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/img/Logout.svg',
                            width: _screenSize.width * .7,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _screenSize.width * .03,
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                          //fontFamily: AppTheme.fontName,
                          fontSize: 25,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w200,
                          //letterSpacing: 0.21,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
