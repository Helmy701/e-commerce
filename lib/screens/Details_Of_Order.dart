import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Seller_Items.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/Line_Decoration.dart';

class DetailsOfOrder extends StatelessWidget {
  const DetailsOfOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: tr("orderDetailsScreenHeader")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '#87941',
                    style: TextStyle(
                      color: myDarkRed,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '06:30 م',
                    style: TextStyle(
                      color: myGreen,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    '17/8/2023',
                    style: TextStyle(
                      color: const Color(0xff707070),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              lineDecoration(
                  startLine: tr("deliveryTo"),
                  endLine: 'العنوان',
                  color: myGreen),
              SizedBox(
                height: 15.h,
              ),
              lineDecoration(
                  startLine: tr("phoneNumber"),
                  endLine: '01028721580',
                  color: myGreen),
              SizedBox(
                height: 25.h,
              ),
              lineDecoration(
                  startLine: tr("payment"), endLine: 'فيزا', color: myGreen),
              SizedBox(
                height: 25.h,
              ),
              sellerItem(),
              SizedBox(
                height: 17.h,
              ),
              Container(
                height: 145.h,
                width: 352.w,
                decoration: BoxDecoration(
                  color: const Color(0xffD4F3C7),
                  border: Border.all(
                    color: const Color(0xff3D7B25),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 25.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      lineDecoration(
                          startLine: tr("numberOfItems"),
                          endLine: '2',
                          fontweight: FontWeight.bold,
                          color: myDarkRed),
                      lineDecoration(
                          startLine: tr("total"),
                          endLine: '10 ر.س',
                          fontweight: FontWeight.bold,
                          color: myDarkRed),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
