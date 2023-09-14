import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

Widget cartItem() {
  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 495.h,
        minHeight: 150.h,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 2,
        itemBuilder: (context, int) {
          return Container(
            height: 145.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.r,
                  offset: const Offset(6, 6),
                  color: const Color.fromRGBO(83, 172, 48, 0.16),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 99.w,
                            height: 87.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: Colors.orange,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 28.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(9.r),
                                  topRight: Radius.circular(9.r),
                                ),
                              ),
                              child: Icon(
                                Icons.favorite_outline,
                                color: myGreen,
                                size: 23.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'برتقال',
                              style: TextStyle(
                                color: myGreen,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Text(
                              'نص تجريبى لوصف المنتج',
                              style: TextStyle(
                                color: Color(0xff707070),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: myGreen,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: const Color(0xffF2F2F2),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: myGreen,
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: myGreen,
                                  size: 30,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.cancel,
                                  size: 18.sp,
                                  color: const Color(0xffD2D2D2),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '1 ${tr("kg")}',
                                  style: TextStyle(
                                    color: myDarkRed,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '5 ${tr("rs")}',
                                  style: TextStyle(
                                    color: myGreen,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 100.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'اسم التاجر',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: myDarkRed),
                        ),
                        Text(
                          'الدمام',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: myDarkRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
