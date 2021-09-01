import 'package:e_school/shared/responsive_ui/device_information.dart';
import 'package:e_school/shared/style/style.dart';
import 'package:flutter/material.dart';

ElevatedButton defaultElevatedButton(
    {required DeviceInformation deviceInfo,
    required Function onPressed,
    required String title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: deviceInfo.screenwidth * 0.1, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(deviceInfo.screenwidth * 0.027),
        )),
    onPressed: () {
      onPressed();
    },
    child: Text(
      title,
      style: secondaryTextStyle(deviceInfo),
    ),
  );
}

TextFormField defaultTextFormFieled(
    {required TextEditingController controller,
    required TextInputType textInputType,
    IconData? iconPrefix,
    Widget? iconSuffix,
    int? maxLines,
    required String text,
    required Function validator,
    Function? onTap,
    bool? enable,
    Function? onChanged,
    bool obscure = false,
    Function? onSubmitted}) {
  return TextFormField(
    enabled: enable != null ? enable : true,
    textDirection: TextDirection.rtl,
    maxLines: maxLines == null ? 1 : maxLines,
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
      fillColor: Colors.white,
      // border: OutlineInputBorder(
      //    // borderRadius: BorderRadius.circular(25),
      //   //  borderSide: BorderSide(width: 0.5, color: Colors.black),
      //     ),
      prefixIcon: Icon(iconPrefix),
      suffixIcon: iconSuffix != null ? iconSuffix : null,
      hintText: text,
      labelText: text,
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
    ),
    validator: (name) {
      return validator(name);
    },
    onTap: () {
      if (onTap == null) return;
      onTap();
    },
    onFieldSubmitted: (name) {
      if (onSubmitted != null) return onSubmitted(name);
      print('Enter here');
      return;
    },
    onChanged: (name) {
      if (onChanged != null) return onChanged(name);
      return;
      //! inside functions
      //? inside classes
    },
    obscureText: obscure,
  );
}

Align defaultBackButton(BuildContext context, double height) {
  return Align(
    alignment: Alignment.topRight,
    child: IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_forward_ios,
        size: height * 0.03,
      ),
    ),
  );
}

Future<void> defaultDialog(
    BuildContext context, DeviceInformation deviceInfo) async {
  return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: secondaryTextStyle(deviceInfo).copyWith(color: Colors.black),
            title: Text(
                'ادخل البريد الالكتروني الخاص بك لكي تصلك رسالة للتأكيد  لأنشاء كلمة مرور جديدة',
              ),
            content: defaultTextFormFieled(
                controller: TextEditingController(),
                textInputType: TextInputType.emailAddress,
                text: 'البريد الالكتروني',
                validator: (email) {
                  if (email.isEmpty) return 'من فضلك ادخل البريد الالكتروني';
                  return null;
                }),
            actions: [
             Container(
               padding: EdgeInsets.symmetric(horizontal: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    defaultElevatedButton(
                  deviceInfo: deviceInfo, onPressed: () {}, title: 'متابعة'),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('رجوع'))
                 ],
               ),
             )
            ],
          ));
}
DropdownButtonFormField defaultDropdownButtonFormField(
    {required String label,
    String? hint,
    required String selectedValue,
    required Function onChanged,
    required DeviceInformation deviceInfo,
    required List<DropdownMenuItem<String>> items}) {
  return DropdownButtonFormField<String>(
      
      decoration: InputDecoration(labelText: label, hintText: hint),
      value: selectedValue,
      onChanged: (newValue) {
        onChanged(newValue);
      },
      items: items);
}
