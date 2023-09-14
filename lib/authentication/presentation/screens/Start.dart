import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: defaultButton(
        function: () {
          Navigator.of(context).pushReplacementNamed("/home");
        },
        text: tr("start"),
        width: 203.w,
        height: 66.h,
      ),
    );
  }
}
