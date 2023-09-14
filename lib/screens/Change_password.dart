import 'package:e_commerce/widgets/Default_App_Bar.dart';
import 'package:e_commerce/widgets/Default_Button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/Default_TextFormFeild.dart';
import '../widgets/Default_TextFormFeildHeader.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: defaultAppBar(
          cartIcon: false,
          title: tr("changePasswordScreen"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.h),
          child: Form(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90.h,
                ),
                textFormFeildHeader(
                    header: tr("currentPasswordTextFieldHeader")),
                SizedBox(
                  height: 16.h,
                ),
                defaulTextFormField(
                  control: currentPasswordController,
                  keyboard: TextInputType.number,
                  validat: (value) {
                    if (value.isEmpty) {
                      return tr("textFeildValidation");
                    }
                    return null;
                  },
                  lable: tr("passwordTextFieldLabel"),
                ),
                SizedBox(
                  height: 30.h,
                ),
                textFormFeildHeader(header: " ${tr("newPasswordHeader")}"),
                SizedBox(
                  height: 16.h,
                ),
                defaulTextFormField(
                  control: newPasswordController,
                  keyboard: TextInputType.number,
                  validat: (value) {
                    if (value.isEmpty) {
                      return tr("textFeildValidation");
                    }
                    return null;
                  },
                  lable: tr("newPasswordTextFieldLabel"),
                ),
                SizedBox(
                  height: 30.h,
                ),
                textFormFeildHeader(header: tr("repasswordTextFieldHeader")),
                SizedBox(height: 16.h),
                defaulTextFormField(
                  control: repasswordController,
                  keyboard: TextInputType.visiblePassword,
                  isPassword: true,
                  validat: (value) {
                    if (value.isEmpty) {
                      return tr("textFeildValidation");
                    } else if (value != newPasswordController) {
                      return tr("repasswordTextFeildValidation");
                    }
                    return null;
                  },
                  lable: tr("repasswordTextFieldLabel"),
                ),
                SizedBox(
                  height: 140.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultButton(
                      function: () {},
                      text: tr("confirmationButton"),
                      height: 66,
                      width: 203,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
