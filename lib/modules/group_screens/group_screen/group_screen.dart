import 'package:clipboard/clipboard.dart';
import 'package:e_school/models/item_group_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

import 'build_group_id_widget.dart';
import 'build_group_members_widget.dart';

class GroupScreen extends StatelessWidget {
  static String routeName = 'groupScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('أسم المجموعة'),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.share)),
      //   ],
      // ),
      body: SafeArea(
        child: responsiveWidget(
          responsive: (context, deviceInfo) => Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                height: AppBar().preferredSize.height,
                color: selectedColorLabel,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BackButton(
                          color: iconColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('images/logo.png'),
                          radius: deviceInfo.screenwidth * 0.05,
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        'اسم الجروب',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: thirdTextStyle(deviceInfo)
                            .copyWith(color: Colors.white),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share, color: iconColor)),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              color: iconColor,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    BuildGroupIdWidget(
                      deviceInfo: deviceInfo,
                      groupId: '39401',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildGroupMembersWidget(
                        deviceInfo: deviceInfo, itemsCount: 5),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: 0.3)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              height: deviceInfo.screenHeight * 0.16,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                   itemsGroups[index].imageName,
                                    fit: BoxFit.fill,
                                    height: deviceInfo.screenHeight * 0.16,
                                    width: deviceInfo.screenwidth * 0.2,
                                  ),
                                  Text(
                                    itemsGroups[index].title,
                                    style: secondaryTextStyle(deviceInfo)
                                        .copyWith(color: Colors.lightBlue),
                                  ),
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: itemsGroups.length),
                  ],
                ),
              ))),
            ],
          ),
        ),
      ),
    );
  }
}
