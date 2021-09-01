import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color iconColor = Colors.white;
TextStyle primaryTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
      fontSize: deviceInfo.screenHeight * 0.03, fontWeight: FontWeight.w500);
}

TextStyle secondaryTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
      fontSize: deviceInfo.screenHeight * 0.025, fontWeight: FontWeight.w500);
}

TextStyle thirdTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
      fontSize: deviceInfo.screenHeight * 0.022, fontWeight: FontWeight.w500);
}

TextStyle subTextStyle(DeviceInformation deviceInfo) {
  return TextStyle(
    fontSize: deviceInfo.screenHeight * 0.017,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );
}

//decorations
final containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(
      color: Colors.grey.shade300,
      width: 0.3,
    ));
