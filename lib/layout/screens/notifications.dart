import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/layout/Home_Layout.dart';
import 'package:e_commerce/widgets/NotificationItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40.w,
      ),
      child: notificationItme(),
    );
  }
}





// Center(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 180.h,
//           ),
//           Text(
//             'لا يوجد إشعارات',
//             style: TextStyle(
//               fontSize: 22.sp,
//               color: myGreen,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 70.h,
//           ),
//           Image.asset(
//             'assets/images/notifications.png',
//             width: 300.w,
//           ),
//         ],
//       ),
//     );