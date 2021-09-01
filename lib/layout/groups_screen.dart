import 'package:e_school/modules/group_screens/create_group_screen/create_group_screen.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

Widget buildGroupsScreen(
    {DeviceInformation? deviceInfo, BuildContext? context}) {
  return Stack(
    children: [
      GridView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'اسم المجموعة',
                          style: thirdTextStyle(deviceInfo!),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Text(
                            'عامة',
                            style: thirdTextStyle(deviceInfo).copyWith(
                              color: Colors.white,
                            ),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'الوصف',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: subTextStyle(deviceInfo),
                    ),
                  ],
                ),
              ),
            );
          }),
      Positioned(
        bottom: 10,
        left: 15,
        child: FloatingActionButton(
          onPressed: () 
          {
            Navigator.pushNamed(context!, CreateGroupScreen.routeName);
          },
          child: Icon(Icons.add),
        ),
      ),
    ],
  );
}
