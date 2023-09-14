import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/cart_Item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: tr("cartScreenHeader"), cartIcon: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr("contents"),
                  style: TextStyle(
                    color: myGreen,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  tr("emptyCartOrder"),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            cartItem(),
            SizedBox(
              height: 40.h,
            ),
            const Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '${tr("total")}  .................  20 ${tr("ryal")}',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: myGreen,
              ),
            ),
            const Spacer(),
            defaultButton(
              function: () {},
              text: tr("continuePurchaseProcessButton"),
              width: 252.w,
              height: 66.h,
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
