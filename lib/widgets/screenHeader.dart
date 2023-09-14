import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

Widget screenHeaderText({required String header}) {
  return Text(
    header,
    style: TextStyle(
      fontSize: 25.sp,
      color: myGreen,
      fontWeight: FontWeight.bold,
    ),
  );
}
