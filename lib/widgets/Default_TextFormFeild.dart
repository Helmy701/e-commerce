import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaulTextFormField({
  required TextEditingController control,
  required TextInputType keyboard,
  double? width,
  bool isPassword = false,
  ValueChanged? onsubmit,
  ValueChanged? onchanged,
  FormFieldValidator? validat,
  required String lable,
  Widget? prefix,
  IconData? suffix,
  GestureTapCallback? onTap,
}) =>
    Container(
      width: width,
      height: 53.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 30,
            color: Color.fromRGBO(83, 172, 48, 0.16),
            spreadRadius: 0,
            offset: Offset(6, 6),
          )
        ],
      ),
      child: TextFormField(
        controller: control,
        keyboardType: keyboard,
        obscureText: isPassword,
        onFieldSubmitted: (s) {
          onsubmit!(s);
        },
        onChanged: onchanged,
        onTap: onTap,
        validator: validat,
        decoration: InputDecoration(
          hintText: lable,
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: const Color(0xFFC0E3B2),
          ),
          // labelText: lable,
          prefixIcon: prefix,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    suffix,
                    color: Colors.green,
                  ),
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: const BorderSide(
              color: Colors.green,
            ),
          ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide: const BorderSide(
          //     color: Colors.green,
          //   ),
          // ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
              width: 0,
            ),
          ),
        ),
      ),
    );
