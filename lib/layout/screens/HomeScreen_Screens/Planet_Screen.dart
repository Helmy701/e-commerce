import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/Home_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({super.key});

  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            category(title: 'التمور', index: 0, width: 78.w),
            category(title: 'فواكه', index: 1, width: 78.w),
            category(title: 'حبوب بعلية', index: 2, width: 89)
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: homeItem(category: currentIndex),
        )
      ],
    );
  }

  Widget category({
    required String title,
    required int index,
    required double width,
  }) {
    return InkWell(
      onTap: () => setState(() {
        currentIndex = index;
      }),
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Container(
          height: 33.h,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: currentIndex != index
                ? const Color(0xffF2F2F2).withOpacity(.30)
                : const Color(0xffF2F2F2),
          ),
          child: Center(
            child: Text(
              title,
              style: currentIndex == index
                  ? TextStyle(
                      color: myGreen,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyle(
                      color: const Color(0xffD2D2D2),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
