import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constant.dart';
import '../screenHeader.dart';

PreferredSizeWidget homeLayoutAppBar({
  required String title,
  bool cartIcon = true,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: cartIcon == true ? true : false,
    title: screenHeaderText(header: title),
    actions: [
      InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Icon(
            Icons.shopping_cart_rounded,
            size: 40,
            color: myGreen,
          ),
        ),
      ),
    ],
    leadingWidth: 200,
    leading: cartIcon == true
        ? InkWell(
            onTap: () {},
            child: Icon(
              size: 50,
              Icons.keyboard_arrow_right_rounded,
              color: myGreen,
            ),
          )
        : Expanded(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 7.w,
                    right: 40.w,
                  ),
                  child: CircleAvatar(
                    radius: 17.5.r,
                    backgroundColor: myGreen,
                  ),
                ),
                Text(
                  'أحمد محمد',
                  style: TextStyle(
                    color: myGreen,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
  );
}
