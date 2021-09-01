import 'package:e_school/modules/auth_screens/choose_auth_screen/build_choose_method_auth.dart';
import 'package:e_school/modules/auth_screens/login_screen/login_screen.dart';
import 'package:e_school/modules/auth_screens/register_screen/register_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseAuthScreen extends StatelessWidget {
  static String routeName = 'chooseAuthScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: responsiveWidget(responsive: (context, deviceInfo) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: deviceInfo.screenHeight * 0.04,
              ),
              Container(
                 height: deviceInfo.screenHeight * 0.1,
                  width: deviceInfo.screenwidth * 0.1,
                child: Image.asset(
                  'images/logoSchool.png',
                  fit: BoxFit.fill,
                  
                  height: deviceInfo.screenHeight * 0.1,
                  width: deviceInfo.screenwidth * 0.1,
                ),
              ),
              SizedBox(
                height: deviceInfo.screenHeight * 0.08,
              ),
              Text(
                'تسجيل الدخول من خلال حساب',
                style: secondaryTextStyle(deviceInfo),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: deviceInfo.screenHeight * 0.04,
              ),
              BuildChooseMethodAuth(
                onPressed: () {},
                icon: FontAwesomeIcons.google,
                label: 'جوجل',
              ),
              BuildChooseMethodAuth(
                onPressed: () {},
                icon: FontAwesomeIcons.facebook,
                label: 'فيس بوك',
              ),
              BuildChooseMethodAuth(
                onPressed: () {},
                icon: FontAwesomeIcons.apple,
                label: 'أبل',
              ),
              SizedBox(
                height: deviceInfo.screenHeight * 0.04,
              ),
              Divider(),
              SizedBox(
                height: deviceInfo.screenHeight * 0.04,
              ),
              defaultElevatedButton(
                  deviceInfo: deviceInfo,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  title: 'تسجيل الدخول من خلال الايميل'),
              SizedBox(
                height: deviceInfo.screenHeight * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text(
                  'جديد ! قم بإنشاء حساب',
                  style: secondaryTextStyle(deviceInfo),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      })),
    );
  }
}
