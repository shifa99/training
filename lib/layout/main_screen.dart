import 'dart:math';

import 'package:e_school/layout/home_layout.dart';
import 'package:e_school/layout/top_students.dart';
import 'package:e_school/layout/top_teacher_following.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column buildMainScreen({
  DeviceInformation? deviceInfo,
}) {
  PageController topTeacherFollowing = PageController();
  return Column(
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent.withOpacity(0.3)),
        onPressed: () {},
        icon: Icon(Icons.people),
        label: Text(
          'الجروب الرسمي لصفك',
          style: secondaryTextStyle(deviceInfo!).copyWith(
            color: Colors.blue,
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      buildTitleHome(deviceInfo: deviceInfo, title: 'المعلم الأعلى متابعة'),
      SizedBox(
        height: 5,
      ),
      buildTopTeacherFollowing(
          deviceInfo: deviceInfo, topTeacherFollowing: topTeacherFollowing),
      SizedBox(
        height: 5,
      ),
      buildTitleHome(
          deviceInfo: deviceInfo, title: 'الطلاب الأعلى نقاطاً اليوم'),
      SizedBox(
        height: 5,
      ),
      Container(
        height: deviceInfo.screenHeight * 0.15,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildTopStudents(deviceInfo: deviceInfo),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: 5),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitleHome(
              deviceInfo: deviceInfo,
              title: 'الاختبارات التي تم انشاؤها مؤخراً'),
          TextButton(
              onPressed: () {},
              child: Text(
                'عرض الكل',
                style: thirdTextStyle(deviceInfo).copyWith(color: Colors.grey),
              )),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: deviceInfo.screenHeight * 0.12,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  width: deviceInfo.screenwidth * 0.32,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Color(Random().nextInt(0xffffffff).toInt())
                            .withAlpha(0xff),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 1.5),
                          child: Text(
                            'رياضيات',
                            style: thirdTextStyle(deviceInfo)
                                .copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Text(
                        'الوحدة التالتة',
                        style: subTextStyle(deviceInfo),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(' احمد محفوظ/أ',
                          style: subTextStyle(deviceInfo),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(width: 5),
            itemCount: 4),
      ),
      SizedBox(
        height: 5,
      ),
      buildTitleHome(deviceInfo: deviceInfo, title: 'الاقسام'),
      SizedBox(
        height: 10,
      ),
      GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, //horizontal,
              mainAxisSpacing: 10,
              crossAxisCount: 3),
          itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                child: Column(
                  children: [
                    Expanded(
                        child: Image.asset(
                      'images/book.png',
                      fit: BoxFit.fill,
                    )),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'اختبارات',
                      style: thirdTextStyle(deviceInfo),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ))
    ],
  );
}
