import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultButton({
  double? width,
  double? height,
  required Function() function,
  required String text,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.bold,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xFF91DB74),
            Color(0xFF53AC30),
          ],
        ),
        borderRadius: BorderRadiusDirectional.circular(33.sp),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
