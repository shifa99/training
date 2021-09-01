import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static final String routeName = 'settingsScreen';
  final double sizeBetweenItems = 0.015;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFF0FC),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'الاعدادات',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Color(0xffEFF0FC),
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: responsiveWidget(
            responsive: (context, deviceInfo) => SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: buildRowSetting(
                              title: 'اللغة',
                              child: DropdownButton<String>(
                                  value: 'العربية',
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('العربية'),
                                      value: 'العربية',
                                      onTap: () {},
                                    ),
                                  ]),
                              deviceInfo: deviceInfo),
                          decoration: containerDecoration,
                        ),
                        SizedBox(
                          height: deviceInfo.screenHeight * sizeBetweenItems,
                        ),
                        Container(
                          decoration: containerDecoration,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              buildRowSetting(
                                  title: 'اظهار الاي دي على بروفايلي',
                                  child: Switch(
                                      value: true,
                                      onChanged: (toggleIdAppear) {}),
                                  deviceInfo: deviceInfo),
                              SizedBox(
                                height: deviceInfo.screenHeight * sizeBetweenItems,
                              ),
                              buildRowSetting(
                                  title:
                                      'تمكين المستخدمين من الكتابة على بروفايلي',
                                  child: Switch(
                                      value: false,
                                      onChanged: (toggleIdAppear) {}),
                                  deviceInfo: deviceInfo),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: deviceInfo.screenHeight * sizeBetweenItems,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: containerDecoration,
                          child: Column(
                            children: [
                              buildRowSetting(
                                  title:
                                      'تلقي اشعارات التطبيق على الهاتف من الخارج',
                                  child: Switch(
                                    
                                      value: false,
                                      onChanged: (toggleIdAppear) {}),
                                  deviceInfo: deviceInfo),
                              SizedBox(
                                height: deviceInfo.screenHeight * sizeBetweenItems,
                              ),
                              buildRowSetting(
                                  title:
                                      'تلقي اشعارات من المعلمين الذي اتابعهم',
                                  child: Switch(
                                      value: false,
                                      onChanged: (toggleIdAppear) {}),
                                  deviceInfo: deviceInfo),
                              SizedBox(
                                height: deviceInfo.screenHeight * sizeBetweenItems,
                              ),
                              buildRowSetting(
                                  title: 'تلقي اشعارات المنافسين',
                                  child: Switch(
                                      value: false,
                                      onChanged: (toggleIdAppear) {}),
                                  deviceInfo: deviceInfo),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }
}

Row buildRowSetting(
    {required String title,
    required Widget child,
    required DeviceInformation deviceInfo}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: secondaryTextStyle(deviceInfo).copyWith(
          color: Colors.black87,
        ),
      ),
      child,
    ],
  );
}
