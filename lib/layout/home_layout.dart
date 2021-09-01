import 'dart:math';

import 'package:e_school/layout/main_screen.dart';
import 'package:e_school/layout/top_students.dart';
import 'package:e_school/layout/top_teacher_following.dart';
import 'package:e_school/modules/settings_screen/settings_screen.dart';
import 'package:e_school/shared/bloc/app_cubit/app_cubit.dart';
import 'package:e_school/shared/bloc/app_cubit/app_cubit_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'homeScreen';
  var topTeacherFollowing = PageController();
  int index = 0;
  late AppCubit appCubit;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppCubitStates>(
      builder: (context, state) => Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        drawer: Drawer(
          child: Container(
            color: Color(0xffEFF0FC),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Color(0xffD8DCFC),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(170),
                            bottomRight: Radius.circular(170),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(top: 30),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/logo.png'),
                                  radius:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                                Text(
                                  'احمد محمد السالم',
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              style:
                                  TextButton.styleFrom(primary: Colors.black87),
                              label: Text('الصف التاسع'),
                            )),
                            SizedBox(width: 5),
                            Expanded(
                                child: TextButton.icon(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        primary: Colors.black87),
                                    icon: Icon(Icons.edit),
                                    label: Text('الترم التاني')))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Image.asset('images/points.png'),
                                  SizedBox(width: 30),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'نقاطي الحالية :  ',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15
                                            // fontSize: 20
                                            )),
                                    TextSpan(
                                        text: '290',
                                        style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 20
                                        )),
                                  ]))
                                ],
                              ),
                            ),
                            buildListItem(
                                icon: Icons.person,
                                title: 'ملف شخصي',
                                onTap: () {}),
                            buildListItem(
                                icon: Icons.people,
                                title: 'اصدقائي',
                                onTap: () {}),
                            buildListItem(
                                icon: Icons.branding_watermark,
                                title: 'قائمة الافضل',
                                onTap: () {}),
                            buildListItem(
                                icon: Icons.people,
                                title: 'من اتابعهم',
                                onTap: () {}),
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            buildListItemCustom(
                                icon: FontAwesomeIcons.handPeace,
                                title: 'شرح الاستخدام',
                                onTap: () {}),
                            buildListItem(
                                icon: Icons.privacy_tip_outlined,
                                title: 'سياسة الخصوصية',
                                onTap: () {}),
                            buildListItemCustom(
                                icon: FontAwesomeIcons.mobileAlt,
                                title: 'للتواصل معنا',
                                onTap: () {}),
                            buildListItem(
                                icon: Icons.info_outline,
                                title: 'عن التطبيق',
                                onTap: () {}),
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.star,
                                color: Color(0xffFDBF03),
                              ),
                              title: Text('العضوية الذهبية'),
                              onTap: () {},
                            ),
                            buildListItem(
                                icon: Icons.settings,
                                title: 'الاعدادات',
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, SettingsScreen.routeName);
                                }),
                            buildListItem(
                                icon: Icons.logout,
                                title: 'تسجيل الخروج',
                                onTap: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appCubit.currentIndex,
          onTap: (newindex) {
            appCubit.chnageIndex(newindex);
          },
          elevation: 5,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'مجموعاتي'),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'جدولي'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'بياناتي'),
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(appCubit.selectedTitle()),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
            Stack(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                    )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 7,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 3),
            child: responsiveWidget(responsive: (context, deviceInfo) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: appCubit.selectedScreen(deviceInfo, context),
              );
            })),
      ),
    );
  }
}

Widget buildTitleHome(
    {required DeviceInformation deviceInfo, required String title}) {
  return Align(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          title,
          style: secondaryTextStyle(deviceInfo),
          textAlign: TextAlign.end,
        ),
      ));
}

ListTile buildListItem(
    {required IconData icon, required String title, required Function onTap}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black87,
    ),
    title: Text(title),
    onTap: () {
      onTap();
    },
  );
}

ListTile buildListItemCustom(
    {required IconData icon, required String title, required Function onTap}) {
  return ListTile(
    leading: FaIcon(icon),
    title: Text(title),
    onTap: () {
      onTap();
    },
  );
}
