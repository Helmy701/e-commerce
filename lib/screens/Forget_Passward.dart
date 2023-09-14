import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/widgets/BackGround.dart';
import 'package:e_commerce/widgets/screenHeader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/Default_Button.dart';
import '../widgets/Phone_TextFormField_With_Label.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  var numberController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  borderRadius: BorderRadius.circular(21.r),
                ),
                child: Form(
                  // to can make falidate in TextFormField
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            screenHeaderText(
                              header: tr("forgetPasswordScreenHeader"),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr("forgetPasswordScreenText"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: myDarkRed,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        phoneTextFormFeildWithLabel(
                            controller: numberController),
                        SizedBox(
                          height: 145.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65.w),
                          child: defaultButton(
                              text: tr("sendButton"),
                              height: 66.h,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  print(numberController.text);
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
      ),
    );
  }
}
