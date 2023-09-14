import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';

PreferredSizeWidget defaultAppBar({
  required String title,
  bool cartIcon = true,
}) {
  return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: screenHeaderText(header: title),
      actions: [
        InkWell(
            onTap: () {},
            child: cartIcon == true
                ? Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      size: 40,
                      color: myGreen,
                    ),
                  )
                : Container()),
      ],
      leading: InkWell(
        onTap: () {},
        child: Icon(
          size: 50,
          Icons.keyboard_arrow_right_rounded,
          color: myGreen,
        ),
      ));
}
