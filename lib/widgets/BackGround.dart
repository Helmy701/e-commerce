import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Background({
  required Widget child,
}) =>
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffF0F2EF),
            Color(0xffFFFFFF),
            Color(0xffFFFFFF),
            Color(0xffF6F9F5),
            Color(0xFFDDF5DE),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -140.w,
            top: -59.5.h,
            child: Image.asset(
              'assets/images/background.png',
              height: 337.5.h,
              width: 337.5.h,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 243.11.w,
            top: 612.31.h,
            child: Image.asset(
              'assets/images/background.png',
              height: 333.h,
              width: 333.h,
              fit: BoxFit.cover,
            ),
          ),
          child,
        ],
      ),
    );
