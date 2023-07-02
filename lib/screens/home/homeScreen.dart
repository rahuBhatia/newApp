import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../model/authModel.dart';
import 'drawer.dart';
import 'homePageTile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  late AuthModel _authModel;
  void initState() {
    super.initState();
    _authModel = Provider.of<AuthModel>(context, listen: false);
    _authModel.getHomeScreenData();
    _authModel.getHomeScreenFloorData();
  }

  String floorFilter = 'Select Floor';
  String floorSelected = '0';
  String searchText = '';

  String? selectedOption;

  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Consumer<AuthModel>(builder: (ctx, homeScreenData, _) {
      print(homeScreenData.homeData.length);
      return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerHome(),
        body: Container(
          padding: EdgeInsets.all(20),
          width: _screenSize.width,
          height: _screenSize.height,
          color: Color(0xffFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //color: Colors.red,
                width: _screenSize.width,
                height: _screenSize.height * .1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'assets/img/icons8-menu.svg',
                          width: _screenSize.width * .08,
                        ),
                      ),
                    ),
                    Container(
                      width: _screenSize.width * .7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Guest Directory",
                            style: TextStyle(
                              //fontFamily: AppTheme.fontName,
                              fontSize: 30,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              //letterSpacing: 0.21,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                width: _screenSize.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0x81C9A1D4),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/img/filter.svg',
                            width: _screenSize.width * .08,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      width: _screenSize.width * .71,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${floorFilter}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton<String>(
                            value:
                                selectedOption, // The currently selected option
                            icon: Container(
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/img/Arrow - Right.svg',
                                  width: _screenSize.width * .08,
                                ),
                              ),
                            ), // Placeholder text
                            onChanged: (newValue) {
                              if (newValue != null) {
                                List<String> parts = newValue.split('_');
                                print('newValue ----  $parts');
                                if (parts[1] == 'All') {
                                  setState(() {
                                    floorFilter = 'Select Floor';
                                  });
                                } else {
                                  setState(() {
                                    floorFilter = '${parts[1]}';
                                  });
                                }
                                floorSelected = parts[0];
                                homeScreenData.refrestHomeData();
                                homeScreenData.getHomeScreenData(
                                    floor: floorSelected,
                                    searchText: searchText);
                              }

                              // setState(() {
                              //   selectedOption = newValue; // Update the selected option
                              // });
                            },
                            // items: <String>[
                            //   for(var f = 0; f <  homeScreenData.homeScreenFloorData.length; f++)
                            //   homeScreenData.homeScreenFloorData[f]['name']
                            // ].map<DropdownMenuItem<String>>((String value) {
                            //   return DropdownMenuItem<String>(
                            //     value: value,
                            //     child: Text(value),
                            //   );
                            // }).toList(),
                            items: <DropdownMenuItem<String>>[
                              new DropdownMenuItem(
                                child: Text('All'),
                                value: '0_All',
                              ),
                              for (var f = 0;
                                  f < homeScreenData.homeScreenFloorData.length;
                                  f++)
                                new DropdownMenuItem(
                                  child: Text(
                                      '${homeScreenData.homeScreenFloorData[f]['name']}'),
                                  value:
                                      '${homeScreenData.homeScreenFloorData[f]['id']}_${homeScreenData.homeScreenFloorData[f]['name']}',
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                width: _screenSize.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(
                  //   color: Colors.grey.shade400,
                  //   width: 1.5,
                  // ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 9),
                        // color: Colors.red,
                        width: _screenSize.width * 0.1,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/img/Search.svg',
                            width: _screenSize.width * .06,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _screenSize.width * 0.6,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          //maxLength: 10,
                          textAlign: TextAlign.start,
                          //obscureText: true,
                          //controller: controller.mobileController,
                          style: const TextStyle(fontSize: 16),
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            searchText = value;
                            homeScreenData.refrestHomeData();
                            homeScreenData.getHomeScreenData(
                                floor: floorSelected, searchText: searchText);
                            //phoneNumber = value;

                            // if (value.length == 10) {
                            //   FocusScope.of(context).unfocus();
                            // }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            counterStyle:
                                const TextStyle(height: double.minPositive),
                            border: InputBorder.none,
                            hintText: "Search by name or bed no.",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF525252),
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
                margin: EdgeInsets.only(top: 10),
                width: _screenSize.width,
                height: _screenSize.height * .66,
                child: (homeScreenData.homeData.length > 0)
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0;
                                i < homeScreenData.homeData.length;
                                i++)
                              // homePageTile(_screenSize , paid: true)
                              homePageTile(
                                  _screenSize, homeScreenData.homeData[i]),
                          ],
                        ),
                      )
                    : (homeScreenData.homeLoder)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(child: Text('No Record Found!')),
              )
            ],
          ),
        ),
      );
    });
  }
}
