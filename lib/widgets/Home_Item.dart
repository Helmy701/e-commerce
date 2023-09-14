import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

Widget homeItem({category}) {
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
        itemCount: 10,
        itemBuilder: (context, int) {
          return Stack(
            children: [
              Container(
                height: 105.h,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          child: Column(
                            textDirection: TextDirection.rtl,
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
                                height: 2.h,
                              ),
                              const Expanded(
                                child: Text(
                                  'نص تجريبى لوصف المنتج',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'اسم التاجر',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: myDarkRed),
                                  ),
                                  Text(
                                    'الدمام',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: myDarkRed,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 85.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          textDirection: TextDirection.rtl,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  textDirection: TextDirection.rtl,
                                  '1 كجم',
                                  style: TextStyle(
                                    color: myDarkRed,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  textDirection: TextDirection.rtl,
                                  '5 ر.س',
                                  style: TextStyle(
                                    color: myGreen,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: myGreen,
                                  size: 23.5,
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                CircleAvatar(
                                  radius: 11.r,
                                  backgroundColor: const Color(0xffF2F2F2),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: myGreen,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: myGreen,
                                  size: 23.5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 41.w,
                  height: 30,
                  decoration: BoxDecoration(
                    color: myGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(9.r),
                      topRight: Radius.circular(9.r),
                    ),
                  ),
                  child: const Icon(
                    Icons.add_shopping_cart_sharp,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              )
            ],
          );
        },
      ),
    ),
  );
}
