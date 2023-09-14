import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

Widget textFormFeildHeader({required String header}) {
  return Text(
    header,
    style: TextStyle(
      fontSize: 18.sp,
      color: myGreen,
    ),
  );
}
