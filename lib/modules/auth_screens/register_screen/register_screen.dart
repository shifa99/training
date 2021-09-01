import 'package:e_school/models/flag_countries.dart';
import 'package:e_school/modules/auth_screens/login_screen/login_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = 'registerScreen';
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var national = TextEditingController();
  var classStudy = TextEditingController();

  var status = TextEditingController();
  String selectedCountry = 'مصر';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: responsiveWidget(responsive: (context, deviceInfo) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                defaultBackButton(context, deviceInfo.screenHeight),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'إنشاء حساب',
                  style: primaryTextStyle(deviceInfo)
                      .copyWith(color: selectedColorLabel),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: ' لديك حساب!',
                        style: secondaryTextStyle(deviceInfo).copyWith(
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: ' قم بتسجيل الدخول من هنا ',
                        style: secondaryTextStyle(deviceInfo).copyWith(
                          decoration: TextDecoration.underline,
                          color: selectedColorLabel,
                        )),
                  ])),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextFormFieled(
                    controller: name,
                    textInputType: TextInputType.name,
                    text: 'الأسم',
                    validator: (name) {
                      if (name.isEmpty) return 'من فضلك ادخل الاسم';
                      return null;
                    }),
                SizedBox(
                  height: 5,
                ),
                defaultTextFormFieled(
                    controller: email,
                    textInputType: TextInputType.emailAddress,
                    text: 'البريد الالكتروني',
                    validator: (value) {
                      if (value.isEmpty) return 'من فضلك ادخل الايميل';
                      return null;
                    }),
                SizedBox(
                  height: 5,
                ),
                defaultTextFormFieled(
                    iconSuffix: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off)),
                    controller: password,
                    textInputType: TextInputType.visiblePassword,
                    text: 'كلمة المرور',
                    validator: (value) {
                      if (value.isEmpty) return 'من فضلك ادخل كلمة المرور';
                      return null;
                    }),
                SizedBox(
                  height: 5,
                ),
                defaultTextFormFieled(
                    iconSuffix: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off)),
                    controller: confirmPassword,
                    textInputType: TextInputType.visiblePassword,
                    text: 'تأكيد كلمة المرور',
                    validator: (value) {
                      if (value.isEmpty)
                        return 'من فضلك ادخل كلمة المرور للتأكيد';
                      return null;
                    }),
                SizedBox(
                  height: 10,
                ),
                defaultDropdownButtonFormField(
                    label: 'الدولة',
                    selectedValue: selectedCountry,
                    onChanged: (value) {
                      print(value);
                    },
                    deviceInfo: deviceInfo,
                    items: countries
                        .map((country) => DropdownMenuItem(
                              value: country.countryName,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(country.countryName),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      country.countryFlag,
                                      style: primaryTextStyle(deviceInfo),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: defaultDropdownButtonFormField(
                          label: 'الصف الدراسي',
                          selectedValue: selectedCountry,
                          onChanged: (value) {
                            print(value);
                          },
                          deviceInfo: deviceInfo,
                          items: countries
                              .map((country) => DropdownMenuItem(
                                    value: country.countryName,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(country.countryName),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            country.countryFlag,
                                            style: primaryTextStyle(deviceInfo),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: defaultDropdownButtonFormField(
                          label: 'الترم الدراسي',
                          selectedValue: selectedCountry,
                          onChanged: (value) {
                            print(value);
                          },
                          deviceInfo: deviceInfo,
                          items: countries
                              .map((country) => DropdownMenuItem(
                                    value: country.countryName,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(country.countryName),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            country.countryFlag,
                                            style: primaryTextStyle(deviceInfo),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextFormFieled(
                    controller: status,
                    textInputType: TextInputType.name,
                    text: 'الاحالة',
                    validator: (value) {
                      return null;
                    }),
                    
                Align(
                    alignment: Alignment.topRight,
                    child: defaultElevatedButton(
                        deviceInfo: deviceInfo,
                        onPressed: () {},
                        title: 'انشاء حساب'))
              ],
            ),
          ),
        );
      })),
    );
  }
}

