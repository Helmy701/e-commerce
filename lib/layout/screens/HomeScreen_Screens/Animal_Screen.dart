import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'AnimalScreen',
      style: TextStyle(fontSize: 50.sp),
    ));
  }
}
