import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

Widget buildTopStudents({required DeviceInformation deviceInfo}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      //height: deviceInfo.screenHeight*0.15,
      width: deviceInfo.screenwidth * 0.71,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300, width: 0.3),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/profile.png'),
            radius: deviceInfo.screenwidth * 0.71 * 0.14,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' عبدالرحمن سامي السالم',
                  style: thirdTextStyle(deviceInfo).copyWith(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'عدد النقاط',
                      style: thirdTextStyle(deviceInfo)
                          .copyWith(color: Colors.grey),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('170'),
                          Text('gold'),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ));
}
