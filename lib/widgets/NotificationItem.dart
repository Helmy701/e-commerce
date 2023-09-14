import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

Widget notificationItme() {
  return ListView.separated(
    itemCount: 2,
    separatorBuilder: (context, index) => const Divider(),
    itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: myDarkRed,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 45.sp,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                'نص تجريبى لمحتوى الإشعارات',
                style: TextStyle(color: myGreen),
              ),
              SizedBox(
                width: 30.w,
              ),
              CircleAvatar(
                radius: 8.5.r,
                backgroundColor: myDarkRed,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 28.w,
              ),
              Text(
                '06:30 م',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: myDarkRed, fontSize: 11.sp),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
