import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';
import 'Default_Button.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF6FFF2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#87914',
                style: TextStyle(
                    color: myDarkRed,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '17/6/2023',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff707070),
                    ),
                  ),
                  Text(
                    '06:30 م',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: myGreen,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '\$150',
                style: TextStyle(
                  color: myGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              itemBuilder: (context, int) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'اسم التاجر',
                      style: TextStyle(
                        color: myDarkRed,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'المدينة',
                      style: TextStyle(
                        color: myDarkRed,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, int) {
                return SizedBox(
                  height: 8.h,
                );
              },
              itemCount: 3,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultButton(
                function: () {},
                text: 'تفاصيل الطلب',
                width: 121.w,
                height: 48.h,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                width: 121.w,
                height: 84.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadiusDirectional.circular(33.sp),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'إلغاء الأمر',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
