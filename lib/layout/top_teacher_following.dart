import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Container buildTopTeacherFollowing(
    {required DeviceInformation deviceInfo,
    required PageController topTeacherFollowing}) {
  return Container(
    height: deviceInfo.screenHeight * 0.18,
    width: deviceInfo.screenwidth,
    padding: EdgeInsets.only(top: 7, bottom: 2, right: 8),
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0.2, color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PageView.builder(
            controller: topTeacherFollowing,
            itemCount: 6,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Row(
              children: [
                Container(
                  height: deviceInfo.screenHeight * 0.15,
                  width: deviceInfo.screenwidth * 0.3,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'images/teacher.png',
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' عبدالله إبراهيم احمد ',
                        style: thirdTextStyle(deviceInfo),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '32', style: TextStyle(color: Colors.cyan)),
                        TextSpan(
                            text: 'متابعًا',
                            style: TextStyle(color: Colors.black)),
                      ])),
                    ],
                  ),
                ),
                //Spacer(),
                Container(
                  width: deviceInfo.screenwidth * 0.25,
                  height: deviceInfo.screenHeight * 0.055,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'فيزياء',
                      style: secondaryTextStyle(deviceInfo).copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        SmoothPageIndicator(controller: topTeacherFollowing, count: 5)
      ],
    ),
  );
}
