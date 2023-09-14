import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

Widget sellerItem() {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: 300.h,
      minHeight: 100.h,
    ),
    child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: 17.h,
            ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(47, 192, 227, 178),
                  offset: const Offset(0, 3),
                  blurRadius: 6.r,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اسم التاجر',
                        style: TextStyle(
                          color: myGreen,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textDirection: TextDirection.rtl,
                        'المدينة',
                        style: TextStyle(
                          color: myGreen,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: 250.h, minHeight: 70.h),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: 2,
                      itemBuilder: (context, int) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: SizedBox(
                            height: 67.94.h,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Container(
                                  width: 76.67.w,
                                  height: 67.94.h,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'فراولة',
                                      style: TextStyle(
                                        color: myDarkRed,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      '1 كيلو',
                                      style: TextStyle(
                                        color: myDarkRed,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '5 ر.س',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: myDarkRed,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: SizedBox(
                    height: 67.94.h,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 76.67.w,
                          height: 67.94.h,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'برتقال',
                              style: TextStyle(
                                color: myDarkRed,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              '1 كيلو',
                              style: TextStyle(
                                color: myDarkRed,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '5 ر.س',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: myDarkRed,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.w,
                    right: 14.w,
                    bottom: 35.h,
                    top: 10.h,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'عدد الأصناف',
                              style: TextStyle(
                                color: myGreen,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              'الإجمالى',
                              style: TextStyle(
                                color: myGreen,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: myGreen,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '15 ر.س',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: myGreen,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
  );
}
