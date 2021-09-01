import 'package:e_school/layout/home_layout.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'loginScreen';
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: responsiveWidget(responsive: (context, deviceInfo) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  defaultBackButton(context, deviceInfo.screenHeight),
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.04,
                  ),
                  Text(
                    'تسجيل الدخول',
                    style: primaryTextStyle(deviceInfo).copyWith(
                      color: selectedColorLabel,
                    ),
                  ),
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.05,
                  ),
                  defaultTextFormFieled(
                      controller: email,
                      textInputType: TextInputType.emailAddress,
                      text: 'البريد الالكتروني',
                      validator: (email) {
                        if (email.isEmpty)
                          return 'من فضلك ادخل البريد الالكتروني';
                        return null;
                      }),
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.03,
                  ),
                  defaultTextFormFieled(
                      controller: password,
                      textInputType: TextInputType.emailAddress,
                      text: 'كلمة السر',
                      iconSuffix: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off),
                      ),
                      validator: (password) {
                        if (password.isEmpty) return 'من فضلك ادخل كلمة المرور';
                        return null;
                      }),
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            await defaultDialog(context, deviceInfo);
                          },
                          child: Text('نسيت كلمة المرور ؟')),
                      defaultElevatedButton(
                          deviceInfo: deviceInfo,
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          },
                          title: 'تسجيل الدخول')
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}
