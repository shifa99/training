import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildChooseMethodAuth extends StatelessWidget {
  Function onPressed;
  IconData icon;
  String label;

  BuildChooseMethodAuth({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black, width: 0.3))),
              onPressed: () {
                onPressed();
              },
              icon: FaIcon(icon),
              label: Text(label)),
        ));
  }
}