import 'package:clipboard/clipboard.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

class BuildGroupIdWidget extends StatelessWidget {
  final DeviceInformation deviceInfo;
  final String groupId;
  BuildGroupIdWidget({required this.deviceInfo, required this.groupId});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'رقم معرف الجروب Id',
                style:
                    thirdTextStyle(deviceInfo).copyWith(color: Colors.black)),
            TextSpan(
                text: groupId,
                style:
                    thirdTextStyle(deviceInfo).copyWith(color: Colors.black)),
          ])),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () async {
              await FlutterClipboard.copy(groupId);
              print('pressed');
              print(await FlutterClipboard.paste());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceInfo.screenwidth * 0.02),
              child: Text(
                'نسخ',
                style: secondaryTextStyle(deviceInfo)
                    .copyWith(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: selectedColorLabel,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}