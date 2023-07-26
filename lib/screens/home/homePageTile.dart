import 'package:flutter/material.dart';

homePageTile(_screenSize, dataToShow) {
  Color redToShowBackGroundFaded = Color(0xFFFFD3D3);
  Color redToShowText = Color(0xFFEE5253);
  Color greenToShowBackGroundFaded = Color(0xffD3FFD5);
  Color greenToShowText = Color(0xff23A993);
  Color colorPaidNotPaidFade = Color(0xFFFFD3D3);
  Color colorPaidNotPaidDark = Color(0xFFEE5253);
  String paidUnPaidText = 'Unpaid';
  if (dataToShow['status'] == 1) {
    paidUnPaidText = 'Paid';
    colorPaidNotPaidFade = greenToShowBackGroundFaded;
    colorPaidNotPaidDark = greenToShowText;
  } else {
    paidUnPaidText = 'Unpaid';
    colorPaidNotPaidFade = redToShowBackGroundFaded;
    colorPaidNotPaidDark = redToShowText;
  }

  return Container(
    margin: EdgeInsets.only(top: _screenSize.height * .02),
    width: _screenSize.width,
    height: _screenSize.height * .15,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color(0x81C9A1D4),
          blurRadius: 12.0,
        ),
      ],
    ),
    child: Row(children: [
      Container(
        width: _screenSize.width * .03,
        height: _screenSize.height * .13,
        decoration: BoxDecoration(
          //color: colorPaidNotPaidDark,
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      Container(
        width: _screenSize.width * .85,
        height: _screenSize.height * .15,
        padding: EdgeInsets.only(left: 15, top: 8),
       // color: Colors.yellow,
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: _screenSize.width * .15,
                      height: _screenSize.height * .09,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x81C9A1D4),
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${dataToShow['bed_no']}",
                              style: TextStyle(
                                //fontFamily: AppTheme.fontName,
                                fontSize: 22,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                //letterSpacing: 0.21,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "Bed No",
                              style: TextStyle(
                                //fontFamily: AppTheme.fontName,
                                fontSize: 13,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                //letterSpacing: 0.21,
                                color: Color(0xFF4B2FB7),
                              ),
                            )
                          ]),
                    ),
                    Text(
                      "${dataToShow['gender']}",
                      style: TextStyle(
                        //fontFamily: AppTheme.fontName,
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        //letterSpacing: 0.21,
                        color: (dataToShow['gender'] == 'male')
                            ? Color(0xff23A993)
                            : Color(0xFFEE5253),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: _screenSize.width * .04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${dataToShow['cfullname']}",
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontSize: 22,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            //letterSpacing: 0.21,
                            color: Color(0xFF444444),
                          ),
                        ),
                        Text(
                          "Service: ${dataToShow['serve_type']}",
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            //letterSpacing: 0.21,
                            color: Color(0xFF444444),
                          ),
                        ),
                        SizedBox(
                          height: _screenSize.height * .004,
                        ),
                        Text(
                          "Age: ${dataToShow['age']}  Floor: ${dataToShow['bed_floor']}",
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            //letterSpacing: 0.21,
                            color: Color(0xFF444444),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: _screenSize.height * .15,
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //padding: EdgeInsets.all(2),
                    alignment: Alignment.center,
                    //width: _screenSize.width * .15,
                    height: _screenSize.height * .03,
                    decoration: BoxDecoration(
                      color: colorPaidNotPaidFade,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    // child: Text(
                    //   paidUnPaidText,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     //fontFamily: AppTheme.fontName,
                    //     fontSize: 15,
                    //     fontFamily: 'Gilroy',
                    //     fontWeight: FontWeight.w600,
                    //     //letterSpacing: 0.21,
                    //     color: colorPaidNotPaidDark,
                    //   ),
                    // ),
                  ),
                  Text(
                    "${dataToShow['nationality']} \$4",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontFamily: AppTheme.fontName,
                      fontSize: 18,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      //letterSpacing: 0.21,
                      color: colorPaidNotPaidDark,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]),
  );
}
