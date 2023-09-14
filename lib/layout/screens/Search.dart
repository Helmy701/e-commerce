import 'package:e_commerce/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/Default_TextFormFeild.dart';

class Search extends StatelessWidget {
  Search({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 58.w,
                height: 53.h,
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
                child: Icon(
                  Icons.format_list_bulleted_sharp,
                  color: myGreen,
                  size: 40.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: defaulTextFormField(
                    prefix: Icon(
                      Icons.search,
                      color: myGreen,
                      size: 30,
                    ),
                    control: searchController,
                    keyboard: TextInputType.text,
                    lable: 'البحث عن منتج أو تاجر'),
              )
            ],
          ),
          SizedBox(
            height: 155.h,
          ),
          Text(
            'لا يوجد نتائج',
            style: TextStyle(
              color: myGreen,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Image.asset(
            'assets/images/search.png',
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
