import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:flutter/material.dart';

class BuildIntroduceItem extends StatelessWidget {
  Widget child;
  DeviceInformation deviceInformation;
  Color backgroundColorContainer;
  Function onpressed;
  BuildIntroduceItem(
      {required this.child,
      required this.deviceInformation,
      required this.backgroundColorContainer,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpressed();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: deviceInformation.screenHeight * 0.02),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
        height: deviceInformation.screenHeight * 0.15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColorContainer,
          border: Border.all(
            color: Colors.grey.shade400,
            width: 0.3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
