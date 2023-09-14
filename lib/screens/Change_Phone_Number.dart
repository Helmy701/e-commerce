import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:e_commerce/widgets/Phone_TextFormField_With_Label.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePhoneNumber extends StatelessWidget {
  TextEditingController numberController = TextEditingController();
  ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: defaultAppBar(
          cartIcon: false,
          title: tr("changePhoneNumberScreen"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.h),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 90.h,
                ),
                phoneTextFormFeildWithLabel(controller: numberController),
                SizedBox(
                  height: 120.h,
                ),
                defaultButton(
                  function: () {},
                  text: tr("confirmationButton"),
                  height: 66,
                  width: 203,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
