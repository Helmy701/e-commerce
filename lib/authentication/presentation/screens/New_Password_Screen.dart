import 'package:e_commerce/widgets/BackGround.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/Default_Button.dart';
import '../../../widgets/Default_TextFormFeild.dart';
import '../../../widgets/Default_TextFormFeildHeader.dart';

// ignore: must_be_immutable
class NewPassword extends StatelessWidget {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  NewPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 37.h,
            ),
            child: Container(
              height: 550.h,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: Color.fromRGBO(83, 172, 48, 0.16),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Form(
                // to can make falidate in TextFormField
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          screenHeaderText(header: tr("newPasswordHeader")),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      textFormFeildHeader(
                          header: " ${tr("newPasswordHeader")}"),
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
                        height: 45.h,
                      ),
                      textFormFeildHeader(
                          header: tr("repasswordTextFieldHeader")),
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
                        height: 155.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65.w),
                        child: defaultButton(
                            text: 'حفظ',
                            height: 66.h,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                print(passwordController.text);
                              }
                            }),
                      ),
                      SizedBox(
                        height: 13.5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
