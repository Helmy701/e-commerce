import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/My_Order_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constant.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'طلباتى'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    navigationBar(
                      index: 0,
                      title: 'جديدة',
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    navigationBar(
                      index: 1,
                      title: 'قيد التحقيق',
                      fontSize: 15.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    navigationBar(
                      index: 2,
                      title: 'قيد التوصيل',
                      fontSize: 15.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    navigationBar(
                      index: 3,
                      title: 'منتهية',
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    navigationBar(
                      index: 4,
                      title: 'ملغى',
                      fontSize: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            MyOrderItem(),
          ],
        ),
      ),
    );
  }

  Widget navigationBar(
      {required String title, required int index, required double fontSize}) {
    return InkWell(
      onTap: () => setState(() {
        currentIndex = index;
      }),
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Container(
          height: 53.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10.r,
                  offset: const Offset(3, 3),
                  color: const Color.fromRGBO(83, 172, 48, 0.16))
            ],
            color: currentIndex != index ? Colors.white : myGreen,
          ),
          child: Center(
            child: Text(
              title,
              style: currentIndex == index
                  ? TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyle(
                      color: myGreen,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
