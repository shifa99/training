import 'package:e_school/modules/group_screens/group_screen/group_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/responsive_ui/responsive_widget.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

class CreateGroupScreen extends StatelessWidget {
  static String routeName = 'createGroup';
  var groupTitle = TextEditingController();
  var groupDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: responsiveWidget(responsive: (context, deviceInfo) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    defaultBackButton(context, deviceInfo.screenHeight),
                    SizedBox(
                      width: deviceInfo.screenwidth * 0.25,
                    ),
                    Text(
                      'إنشاء مجموعة',
                      style: secondaryTextStyle(deviceInfo),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextFormFieled(
                    controller: groupTitle,
                    textInputType: TextInputType.text,
                    text: 'عنوان المجموعة',
                    validator: (title) {
                      if (title.isEmpty) return 'من فضلك ادخل اسم المجموعة';
                      return null;
                    }),
                SizedBox(
                  height: 10,
                ),
                defaultTextFormFieled(
                    maxLines: 3,
                    controller: groupTitle,
                    textInputType: TextInputType.text,
                    text: 'وصف المجموعة',
                    validator: (description) {
                      if (description.isEmpty)
                        return 'من فضلك ادخل وصف المجموعة';
                      return null;
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: defaultDropdownButtonFormField(
                          label: 'الصف الدراسي',
                          selectedValue: 'الصف الاول',
                          onChanged: (classNumber) {},
                          deviceInfo: deviceInfo,
                          items: []),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: defaultDropdownButtonFormField(
                          label: 'الترم الدراسي',
                          selectedValue: 'الترم الاول الاول',
                          onChanged: (classNumber) {},
                          deviceInfo: deviceInfo,
                          items: []),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                defaultDropdownButtonFormField(
                    label: 'المادة',
                    selectedValue: 'كيمياء',
                    onChanged: (classNumber) {},
                    deviceInfo: deviceInfo,
                    items: []),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'نوع المجموعة',
                  style: thirdTextStyle(deviceInfo),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: RadioListTile(
                            title: Text('عامة'),
                            value: 'عامة',
                            groupValue: 'عامة',
                            onChanged: (groupType) {})),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: RadioListTile(
                            title: Text('خاصة'),
                            value: 'خاصة',
                            groupValue: 'عامة',
                            onChanged: (groupType) {})),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                defaultElevatedButton(
                    deviceInfo: deviceInfo,
                    onPressed: () {
                      Navigator.pushNamed(context, GroupScreen.routeName);
                    },
                    title: 'إنشاء مجموعة'),
              ],
            ),
          );
        })),
      ),
    );
  }
}
