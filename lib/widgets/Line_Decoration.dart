import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget lineDecoration({
  required String startLine,
  required String endLine,
  FontWeight fontweight = FontWeight.w500,
  required Color color,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        startLine,
        style: TextStyle(
          color: color,
          fontSize: 16.sp,
          fontWeight: fontweight,
        ),
      ),
      Text(
        endLine,
        style: TextStyle(
          color: color,
          fontSize: 16.sp,
          fontWeight: fontweight,
        ),
      ),
    ],
  );
}
