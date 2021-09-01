import 'package:e_school/modules/onboarding_screen/onboarding_screen.dart';
import 'package:e_school/shared/bloc/app_cubit/app_cubit.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:flutter/material.dart';

enum Language { arabic, english }

class ChooseLanguageScreen extends StatefulWidget {
  static String routeName = 'choose_language_screen';

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  bool selectedLanguageArabic = true;
  Language language = Language.arabic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF7F8FB),
        body: responsiveWidget(responsive: (context, deviceInfo) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        'images/helloScreen.png',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'اختر اللغة',
                    style: TextStyle(
                        fontSize: deviceInfo.screenHeight * 0.035,
                        color: Color(0xff5F71FE),
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Choose Language',
                      style: TextStyle(
                          fontSize: deviceInfo.screenHeight * 0.035,
                          color: Color(0xff5F71FE),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildChooseLanguage(
                          deviceInfo,
                          choose: () {
                            setState(() {
                              language = Language.arabic;
                            });
                            
                            AppCubit.get(context).changeLocaleApp('ar');
                            Navigator.pushNamed(
                                context, OnboardingScreen.routeName);
                          },
                          label: 'ع',
                          text: 'عربي',
                          colorContainer: language == Language.arabic
                              ? Colors.white
                              : Color(0xffF8F8FF),
                          colorLabel: language == Language.arabic
                              ? selectedColorLabel
                              : unselectedColorLabel,
                          colorText: language == Language.arabic
                              ? selectedColorText
                              : unselectedColorText,
                        ),
                        Expanded(child: Container()),
                        //
                        buildChooseLanguage(
                          deviceInfo,
                          choose: () {
                            setState(() {
                              language = Language.english;
                            });
                            AppCubit.get(context).changeLocaleApp('en');
                            Navigator.pushNamed(
                                context, OnboardingScreen.routeName);
                          },
                          label: 'aA',
                          text: 'English',
                          colorContainer: language == Language.english
                              ? Colors.white
                              : Color(0xffF8F8FF),
                          colorLabel: language == Language.english
                              ? selectedColorLabel
                              : unselectedColorLabel,
                          colorText: language == Language.english
                              ? selectedColorText
                              : unselectedColorText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ));
        }));
  }

  Expanded buildChooseLanguage(
    DeviceInformation deviceInfo, {
    required Function choose,
    required String label,
    required String text,
    required Color colorContainer,
    required Color colorLabel,
    required Color colorText,
  }) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () {
          choose();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorContainer,
            border: Border.all(color: Colors.black12, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: deviceInfo.screenHeight * 0.035,
                    color: colorLabel),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: deviceInfo.screenHeight * 0.03, color: colorText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
