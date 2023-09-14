import 'package:e_commerce/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        moreRow(icon: Icons.groups_2, label: 'من نحن', onTap: () {}),
        moreRow(icon: Icons.person_2, label: 'الحساب', onTap: () {}),
        moreRow(
            icon: Icons.quick_contacts_dialer, label: 'التواصل', onTap: () {}),
        moreRow(
            icon: Icons.my_library_books_rounded,
            label: 'الشروط والاحكام',
            onTap: () {}),
        moreRow(icon: FontAwesomeIcons.box, label: 'الطلبات', onTap: () {}),
        moreRow(icon: Icons.favorite, label: 'المفضلة', onTap: () {}),
        moreRow(icon: Icons.settings, label: 'الإعدادات', onTap: () {}),
        moreRow(icon: Icons.share, label: 'مشاركة التطبيق', onTap: () {}),
        moreRow(icon: Icons.star, label: 'تقييم التطبيق', onTap: () {}),
      ],
    );
  }

  Widget moreRow({
    required IconData icon,
    required String label,
    required Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 10.h,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: myGreen,
              size: 25,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              label,
              style: TextStyle(
                color: myGreen,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
