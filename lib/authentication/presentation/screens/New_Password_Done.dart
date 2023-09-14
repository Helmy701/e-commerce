import 'package:e_commerce/widgets/BackGround.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordIsDone extends StatelessWidget {
  const NewPasswordIsDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 285.h,
              ),
              screenHeaderText(header: tr("newPasswordIsDoneScreenHeader")),
              SizedBox(
                height: 45.h,
              ),
              Image.asset(
                'assets/images/done.png',
                height: 258.h,
                width: 258.h,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 160.h,
              ),
              defaultButton(
                function: () {},
                text: tr("okButton"),
                width: 203,
                height: 66,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
