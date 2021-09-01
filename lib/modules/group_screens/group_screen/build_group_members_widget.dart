import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

Widget buildGroupMembersWidget(
    {required DeviceInformation deviceInfo, required int itemsCount}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'انضم صالح عبدالفتاح لهذه المجموعة ',
        style: thirdTextStyle(deviceInfo).copyWith(color: selectedColorLabel),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        alignment: Alignment.topRight,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
              color: Colors.lightGreenAccent,
              width: deviceInfo.screenwidth * 0.26,
            ),
            if(itemsCount!=0)
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: deviceInfo.screenwidth * 0.032,
            ),
            if(itemsCount>=2)
            Positioned(
              right: deviceInfo.screenwidth * 0.036,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
                radius: deviceInfo.screenwidth * 0.032,
              ),
            ),
            if(itemsCount>=3)
            Positioned(
              right: deviceInfo.screenwidth * 0.036 * 2,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
                backgroundColor: Colors.deepOrangeAccent,
                radius: deviceInfo.screenwidth * 0.032,
              ),
            ),
            if(itemsCount>3)
            Positioned(
              right: deviceInfo.screenwidth * 0.036 * 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  '+120',
                  style: thirdTextStyle(deviceInfo),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}