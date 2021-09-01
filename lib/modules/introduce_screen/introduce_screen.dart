import 'package:e_school/modules/auth_screens/choose_auth_screen/choose_auth_screen.dart';
import 'package:e_school/modules/auth_screens/login_screen/login_screen.dart';
import 'package:e_school/modules/introduce_screen/build_introduce_item.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

enum TypePerson { teacher, student }

class IntroduceScreen extends StatefulWidget {
  static String routeName = 'introduceScreen';

  @override
  _IntroduceScreenState createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
  TypePerson person = TypePerson.teacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: responsiveWidget(responsive: (context, deviceInfo) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: deviceInfo.screenHeight * 0.04,
                ),
                Image.asset(
                  'images/logoSchool.png',
                  fit: BoxFit.fill,
                  height: deviceInfo.screenHeight * 0.07,
                  width: deviceInfo.screenwidth * 0.1,
                ),
                SizedBox(
                  height: deviceInfo.screenHeight * 0.08,
                ),
                Text(' من انت ؟',
                    style: primaryTextStyle(deviceInfo).copyWith(
                        color: Colors.black87, fontWeight: FontWeight.w100)),
                SizedBox(
                  height: deviceInfo.screenHeight * 0.04,
                ),
                BuildIntroduceItem(
                  child: Row(
                    children: [
                      Image.asset(
                        'images/teacher.png',
                        fit: BoxFit.fill,
                        width: deviceInfo.screenwidth * 0.3,
                      ),
                      Spacer(),
                     
                       Text(
                        'معلم',
                        style: primaryTextStyle(deviceInfo)
                            .copyWith(color: secondaryColorText),
                      ),
                    ],
                  ),
                  deviceInformation: deviceInfo,
                  backgroundColorContainer: person == TypePerson.teacher
                      ? Colors.white
                      : Color(0xffFBFCFD),
                  onpressed: () {
                    setState(() {
                      person = TypePerson.teacher;
                    });
                  },
                ),
                BuildIntroduceItem(
                  child: Row(
                    children: [
                      Text(
                        'طالب',
                        style: primaryTextStyle(deviceInfo)
                            .copyWith(color: secondaryColorText),
                      ),
                      Spacer(),
                      
                      Image.asset(
                        'images/student.jpg',
                        fit: BoxFit.fill,
                        width: deviceInfo.screenwidth * 0.3,
                      ),
                    ],
                  ),
                  deviceInformation: deviceInfo,
                  backgroundColorContainer: person == TypePerson.student
                      ? Colors.white
                      : Color(0xffFBFCFD),
                  onpressed: () {
                    setState(() {
                      person = TypePerson.student;
                    });
                  },
                ),
                SizedBox(
                  height: deviceInfo.screenHeight * 0.05,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: defaultElevatedButton(
                      deviceInfo: deviceInfo,
                      onPressed: () {
                        Navigator.pushNamed(context, ChooseAuthScreen.routeName);
                      },
                      title: 'التالي'),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

